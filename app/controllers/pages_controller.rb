class PagesController < ApplicationController

  def index
    @candidate = Candidate.sorted
    @candidates = Candidate.all

    @notifications = Notification.all

    @user = current_user
    @test = @user.get_up_voted Candidate.limit(4)
    #paginate(page: params[:page])
    @size = @test.size

    @city = @user.get_up_voted CityRace.limit(4)
    @state = @user.get_up_voted StateRace.limit(4)
    @state_size = @state.size
 
    @national = @user.get_up_voted NationalRace.limit(4)
    @national_size = @national.size
    @localstate = StateRace.where(state: current_user.state)
    
    @q = @localstate.ransack(params[:q])
    @local = @q.result(distinct: true).paginate(page: params[:page]).all

    @x = Notification.where(:user_id =>  current_user, :read => false).all.order! 'created_at DESC'
  
  end


  def upvote
    @candidate = Candidate.find(params[:id])
    @candidate.upvote_from current_user
    redirect_to candidates_path
  end

  def downvote
    @candidate = Candidate.find(params[:id])
    @candidate.downvote_from current_user
    redirect_to candidates_path
  end

	before_action :authenticate_user!
end
