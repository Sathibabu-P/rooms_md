class UserDashboardController < ApplicationController
	before_filter :authenticate_user! 
  before_action :password_filed , only: [:update_password]
  include ActionView::Helpers::DateHelper
  def index
  	@profile = current_user.profile 
  	unless @profile.present?
  		@profile = Profile.new
  		@profile.user = current_user
  		@profile.save!
  	end
    @user = current_user
  end
  def messages
  	@messages = current_user.messages
  end



  def update_password 
     @user = User.find(current_user.id)
     
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to user_profile_url
    else
     redirect_to user_profile_url
    end
  end

  def favorites
    @listings = current_user.votes.up.for_type(Listing).votables
  end

  

  private

  def password_filed
    if params[:user][:password].blank? || params[:user][:password_confirmation].blank?    
    params[:user].delete(:password)
    params[:user].delete(:password_confirmation)
    end
  end

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:email,:password, :password_confirmation,:current_password)
  end



end
