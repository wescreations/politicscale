class StateRacesController < ApplicationController
  
respond_to :html, :json

before_action :authenticate_user!

  before_action :find_state_races, :only => [:index, :upvote, :downvote]

  def index
    
    @candidate = Candidate.sorted
    @state = StateRace.new
    @candidates = Candidate.all
    @q = StateRace.ransack(params[:q])
    @racs = @q.result(distinct: true).paginate(page: params[:page]).all.order(:cached_votes_score => :desc)
    @localstate = StateRace.where(state: current_user.state)
    @notifications = Notification.all.order! 'created_at DESC'
    @x = Notification.where(:user_id =>  current_user, :read => false).all.order! 'created_at DESC'
  end


  def show
        @candidates = Candidate.all
    @state_race = StateRace.find(params[:id])
        @candidate = Candidate.sorted
      @notifications = Notification.all.order! 'created_at DESC'
    @x = Notification.where(:user_id =>  current_user, :read => false).all.order! 'created_at DESC'

    if params[:notify_id].present?
        @notice = Notification.find(params[:notify_id])
        @notice.update!(read: true)
      else 
        #do nothing
    end
  end

  def new
    @notification = Notification.new
    @state_race = StateRace.new
    respond_modal_with @state_race
  end

  def create
    @state_race = StateRace.new(state_race_params)
    if @state_race.save
      row = @state_race
      User.where(:state => @state_race.state).each do |u|
        @notification = Notification.new(:message => 'a new ' + @state_race.state + ' state race has been added', 
          :message_type => 'state_new', :user_id => u.id, :link_path => @state_race.id)
        @notification.save
        $state_race = @state_race
      end
    NewStateRaceMailer.send_request(row)
    @notification.save
    flash[:notice] = "Race Created Successfully"
    redirect_to(state_races_path)
  else
    render('new')
  end

  end

  def edit
    @state_race = StateRace.find(params[:id])
    respond_modal_with @state_race
  end

  def update
    @state_race = StateRace.find(params[:id])
    if @state_race.update_attributes(state_race_params)
        @state_race.votes_for.up.by_type(User).voters.each do |u|
        @notification = Notification.new(:message => 'A State Race You Follow Has Been Updated.', 
          :message_type => 'state_new', :user_id => u.id, :link_path => @state_race.id)
        @notification.save
        end
    flash[:notice] = "Race Updated Successfully"
    redirect_to(state_races_path(@state_race))
  else
    render('edit')
  end
end

  def vote
        @state_race = StateRace.find(params[:id])
    if !current_user.liked? @state_race
      @state_race.liked_by current_user
    elsif current_user.liked? @state_race
      @state_race.unliked_by current_user
    end
   respond_to do |format|
      format.js
   end
  end

  def delete
    @state_race = StateRace.find(params[:id])
    respond_modal_with @state_race
  end

  def destroy
    @state_race = StateRace.find(params[:id])
    @state_race.destroy
    flash[:notice] = "Race '#{@state_race.name}' Successfully"
    redirect_to(state_race_path)
  end

private

  def state_race_params
    params.require(:state_race).permit(:previously_held_by, :name, 
      :democratic_nominee, :dems_runnings, :republican_nominee, 
      :repubs_runnings, :num_of_dems, :num_of_repubs,
      :incumbent, :salary, :election_date, :past_elections, :next_debate, :state, :poll)
  end

  def find_state_races
    @state_race = StateRace.sorted
  end



end
