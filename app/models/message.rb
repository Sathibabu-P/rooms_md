class Message < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
	validates :name,:message,:phoneno, presence: true
end
