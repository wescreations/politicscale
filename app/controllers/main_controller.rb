
  
class MainController < ApplicationController



  def index
  end

  def search
    @candidates    = Candidate.ransack(name_cont: params[:q]).result(distinct: true)
    @national_races          = NationalRace.ransack(name_cont: params[:q]).result(distinct: true)
    @state_races          = StateRace.ransack(name_cont: params[:q]).result(distinct: true)

    respond_to do |format|
      format.html {

      }
      format.json {
        @state_races = @state_races.limit(5)
      	@national_races = @national_races.limit(5)
        @candidates = @candidates.limit(5)


      }
    end
  end
end
