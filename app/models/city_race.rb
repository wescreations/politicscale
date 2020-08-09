class CityRace < ApplicationRecord

acts_as_votable

self.per_page = 8

has_many :candidates

scope :sorted, lambda { order("name ASC") }

#	def self.search_by(search_term)
#		where("LOWER(office) LIKE :search_term", search_term: "%#{search_term.downcase}%")
#	end

end