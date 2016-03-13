class Listing < ActiveRecord::Base
	has_and_belongs_to_many :rules
	has_and_belongs_to_many :amenities
	validates :title,:description,:room_type,:bedrooms,:rent,:rooms_for_rent,:available_from,:minimumstay,:current_roommates,:prefred_gender,:prefred_age,:prefred_occupation, :landmark, :security_deposit,:furnishing_status, presence: true
	has_many :pictures, :dependent => :destroy
end
