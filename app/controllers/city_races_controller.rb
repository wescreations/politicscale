class CityRacesController < ApplicationController
  
  respond_to :html, :json

  before_action :authenticate_user!

  before_action :find_city_races, :only => [:index, :upvote, :downvote]

  def index
    #@city_races = CityRace.paginate(page: params[:page]).all.order(:cached_votes_score => :desc)
    @city = CityRace.new
    @candidate = Candidate.sorted
    @candidates = Candidate.all
    @q = CityRace.ransack(params[:q])
    @cities = @q.result(distinct: true).paginate(page: params[:page]).all.order(:cached_votes_score => :desc)
    @notifications = Notification.all
    @x = Notification.where(:user_id =>  current_user, :read => false).all.order! 'created_at DESC'
  end


  def show
      @candidates = Candidate.all
      @city_race = CityRace.find(params[:id])
      @candidate = Candidate.sorted
  end

  def new
    @city_race = CityRace.new
    respond_modal_with @city_race
  end

  def create
    @city_race = CityRace.new(city_race_params)
    if @city_race.save
    flash[:notice] = "Race Created Successfully"
    redirect_to(city_races_path)
  else
    render('new')
  end
  end

  def edit
    @city_race = CityRace.find(params[:id])
    respond_modal_with @city_race
  end

  def update
    @city_race = CityRace.find(params[:id])
    if @city_race.update_attributes(city_race_params)
    flash[:notice] = "Race Updated Successfully"
    redirect_to(city_races_path(@city_race))
  else
    render('edit')
  end
end

  def upvote
    @city_race = CityRace.find(params[:id])
    @city_race.upvote_from current_user
    redirect_to city_race_path
  end

  def downvote
    @city_race = CityRace.find(params[:id])
    @city_race.downvote_from current_user
    redirect_to city_race_path
  end

  def delete
    @city_race = CityRace.find(params[:id])
    respond_modal_with @city_race
  end

  def destroy
    @city_race = CityRace.find(params[:id])
    @city_race.destroy
    flash[:notice] = "Race '#{@city_race.office}' Successfully"
    redirect_to(city_race_path)
  end

private

  def city_race_params
    params.require(:city_race).permit(:previously_held_by, :office, 
      :democratic_nominee, :dems_runnings, :republican_nominee, 
      :repubs_runnings, :num_of_dems, :num_of_repubs,
      :incumbent, :salary, :election_date, :past_elections, :next_debate, :home_state)
  end

  def find_city_races
    @city_race = CityRace.sorted
  end

end
