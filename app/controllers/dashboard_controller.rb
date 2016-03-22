class DashboardController < ApplicationController
before_filter :authenticate_admin!
layout 'admin'
  def index
  end

  def messages
  	@messages = Message.all
  end
end
