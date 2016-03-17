class HomeController < ApplicationController
  def index
  	@listings = Listing.all
  end

  def show
  	@listing = Listing.find(params[:id])
  	@pictures = @listing.pictures
  end
end
