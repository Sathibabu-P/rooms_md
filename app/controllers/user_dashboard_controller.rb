class UserDashboardController < ApplicationController
	before_filter :authenticate_user! 
  include ActionView::Helpers::DateHelper
  def index
  	@profile = current_user.profile 
  	unless @profile.present?
  		@profile = Profile.new
  		@profile.user = current_user
  		@profile.save
  	end
    @user = current_user
  end
  def messages
  	@messages = current_user.messages
  end



  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)      
       sign_in @user, :bypass => true      
    end
    @profile = current_user.profile 
    render 'index'
    
  end

  def update_settings
    @profile = current_user.profile 
    @profile.update_attributes(params[:name] => params[:value])
    render 'text' => 'success'
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation,:current_password)
  end



end
