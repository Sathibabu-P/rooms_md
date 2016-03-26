class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  has_many :user_provider, :dependent => :destroy
  has_one :profile, :dependent => :destroy
  has_many :listings , :dependent => :destroy
  has_many :messages
  devise :database_authenticatable, :registerable,:omniauthable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauth_providers => [:facebook,  :google_oauth2]
   ratyrate_rater
   # validates :password, :password_confirmation, presence: true    

end
