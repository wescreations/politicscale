class CandidatesController < ApplicationController

  before_action :authenticate_user!
  
  before_action :find_candidates, :only => [:index, :upvote, :downvote, :vote]

    respond_to :html, :json

  def index
    @can = Candidate.new
    @q = Candidate.ransack(params[:q])
    @cans = @q.result(distinct: true).paginate(page: params[:page]).all.order(:cached_votes_score => :desc)
    @user = current_user
    @test = @user.get_up_voted Candidate
    @notifications = Notification.all.order! 'created_at DESC'
    @x = Notification.where(:user_id =>  current_user, :read => false).all.order! 'created_at DESC'
  end

  def edit
    @candidate = Candidate.find(params[:id])
    @national_races = NationalRace.all
    @state_races = StateRace.all
    @national_races2 = NationalRace.all
    @state_races2 = StateRace.all
    respond_modal_with @candidate
  end

  def show
    @candidate = Candidate.find(params[:id])
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
    @candidate = Candidate.new
    @notification = Notification.new
    @candidate = Candidate.new
    @national_races = NationalRace.all
    @state_races = StateRace.all
    @national_races2 = NationalRace.all
    @state_races2 = StateRace.all
    respond_modal_with @candidate
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save

      row = @candidate

      User.where(:state => @candidate.home_state).each do |u|
        @notification = Notification.new(:message => 'a new az candidate', 
          :message_type => 'update', :user_id => u.id, :link_path => @candidate.id)
        @notification.save
        $candidate = @candidate
      end
    CandidateMailer.send_request(row)
    flash[:notice] = "Candidate Created Successfully"
    redirect_to(candidates_path)
    else
    render('new')
    end
  end

  def update
    @candidate = Candidate.find(params[:id])
    if @candidate.update_attributes(candidate_params)
  
        @candidate.votes_for.up.by_type(User).voters.each do |u|
        @notification = Notification.new(:message => 'A Candidate You Follow Has Been Updated.', 
          :message_type => 'update', :user_id => u.id, :link_path => @candidate.id)
        @notification.save
      end
      flash[:notice] = "Candidate Updated Successfully"
      redirect_to(candidate_path(@candidate))
      flash.discard
    else
      render('edit')
    end
  end

  def delete
    @candidate = Candidate.find(params[:id])
    respond_modal_with @can
  end

  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy
    flash[:notice] = "Candidate '#{@candidate.name}' Successfully"
    redirect_to(candidates_path)
  end

 

  def vote
        @candidate = Candidate.find(params[:id])
    if !current_user.liked? @candidate
      @candidate.liked_by current_user
    elsif current_user.liked? @candidate
      @candidate.unliked_by current_user
    end
   respond_to do |format|
      format.js
   end
  end

  def downvote
    @candidate = Candidate.find(params[:id])
    @candidate.downvote_from current_user
    redirect_to candidates_path
  end

  private

  def candidate_params
    params.require(:candidate).permit(:name, 
    :age, :office_running_for, :bio, :avatar, 
    :national_race_id, :party, :state_race_id, :current_office, 
    :national_race_id2, :state_race_id2, :home_state, :dem_nom, :repub_nom, :score
    )
  end


  def notifications_params
    params.require(:notification).permit(:text)
  end


  def find_candidates
    @candidate = Candidate.sorted
  end


end