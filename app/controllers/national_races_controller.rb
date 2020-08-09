class NationalRacesController < ApplicationController
  
  respond_to :html, :json


before_action :authenticate_user!

  before_action :find_national_races, :only => [:index, :upvote, :downvote]

  def index
    #@national_races = NationalRace.paginate(page: params[:page]).all.order(:cached_votes_score => :desc)
    @candidate = Candidate.sorted
    @national = NationalRace.new
    @candidates = Candidate.all
    @q = NationalRace.ransack(params[:q])
    @national_races = @q.result(distinct: true).paginate(page: params[:page]).all.order(:cached_votes_score => :desc)
    @notifications = Notification.all.order! 'created_at DESC'
    @x = Notification.where(:user_id =>  current_user, :read => false).all.order! 'created_at DESC'
  end


  def show
    @candidates = Candidate.all
    @national_race = NationalRace.find(params[:id])
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
    @national_race = NationalRace.new
    respond_modal_with @national_race
        @candidates = Candidate.all
  end

  def create
    @national_race = NationalRace.new(national_race_params)
    if @national_race.save
      row = @national_race

      User.where(:state => @national_race.state).each do |u|
        @notification = Notification.new(:message => 'a new ' + @national_race.state + ' national race has been added.', 
          :message_type => 'national_new', :user_id => u.id, 
          :link_path => @national_race.id)
        @notification.save
        $national_race = @national_race
      end
    NewNationalRaceMailer.send_request(row)
    @notification.save
    flash[:notice] = "Race Created Successfully"
    redirect_to(national_races_path)
  else
    render('new')
  end



  end

  def edit
    @national_race = NationalRace.find(params[:id])
    respond_modal_with @national_race
  end

  def update
    @national_race = NationalRace.find(params[:id])
    if @national_race.update_attributes(national_race_params)
        @national_race.votes_for.up.by_type(User).voters.each do |u|
        @notification = Notification.new(:message => 'A National Race You Follow Has Been Updated.', 
          :message_type => 'national_new', :user_id => u.id, :link_path => @national_race.id)
        @notification.save
      end
    flash[:notice] = "Race Updated Successfully"
    redirect_to(national_races_path(@national_race))
  else
    render('edit')
  end
end

  def vote
        @national_race = NationalRace.find(params[:id])
    if !current_user.liked? @national_race
      @national_race.liked_by current_user
    elsif current_user.liked? @national_race
      @national_race.unliked_by current_user
    end
   respond_to do |format|
      format.js
   end
  end



  def delete
    @national_race = NationalRace.find(params[:id])
    respond_modal_with @national_race
  end

  def destroy
    @national_race = NationalRace.find(params[:id])
    @national_race.destroy
    flash[:notice] = "Race '#{@national_race.name}' Successfully"
    redirect_to(national_race_path)
  end

private

  def national_race_params
    params.require(:national_race).permit(:previously_held_by, :name, 
      :democratic_nominee, :dems_runnings, :republican_nominee, 
      :repubs_runnings, :num_of_dems, :num_of_repubs,
      :incumbent, :salary, :election_date, :past_elections, :next_debate, :poll, :state, :avatar)
  end

  def find_national_races
    @national_race = NationalRace.sorted
  end

end
