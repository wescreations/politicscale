class Candidate < ApplicationRecord
	
	self.per_page = 8

	acts_as_votable

	scope :youngest, lambda { order("age ASC") }
	scope :sorted, lambda { order("name ASC") }
	#scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}

	validates_presence_of :name
	validates_uniqueness_of :name
	#validates_presence_of :main_photo

	#has_one_attached :main_photo

  	has_attached_file :avatar
  	# Validate the attached image is image/jpg, image/png, etc
  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	belongs_to :national_race, { :optional => true}
	belongs_to :city_race, { :optional => true}
	belongs_to :state_race, { :optional => true}

#	def self.search_by(search_term)
#		where("LOWER(name || age || party) LIKE :search_term", search_term: "%#{search_term.downcase}%")
#	end
end