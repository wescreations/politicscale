class NationalRace < ApplicationRecord

acts_as_votable

self.per_page = 8

has_many :candidates
scope :sorted, lambda { order("name ASC") }
#	def self.search_by(search_term)
#		where("LOWER(office) LIKE :search_term", search_term: "%#{search_term.downcase}%")
#	end
  has_attached_file :avatar
  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
