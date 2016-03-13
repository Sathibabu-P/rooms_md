class Amenity < ActiveRecord::Base
	has_and_belongs_to_many :listings
	validates :name, presence: true, uniqueness: true
end
