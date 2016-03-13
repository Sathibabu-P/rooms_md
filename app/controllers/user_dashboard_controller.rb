class UserDashboardController < ApplicationController
	before_filter :authenticate_user!
  def index
  	@profile = current_user.profile 
  	unless @profile.present?
  		@profile = Profile.new
  		@profile.user = current_user
  		@profile.save
  	end
  end
  def messages
  	
  end
end
