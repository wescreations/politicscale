json.candidates do
	json.array!(@candidates) do |candidate|
	json.name candidate.name
	json.url candidate_path(candidate)
  end
end

json.national_races do
	json.array!(@national_races) do |national_race|

	json.name national_race.name
	json.url national_race_path(national_race)
  end
end

json.state_races do
	json.array!(@state_races) do |state_race|

	json.name state_race.name
	json.url state_race_path(state_race)
  end
end