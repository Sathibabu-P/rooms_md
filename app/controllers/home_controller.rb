class HomeController < ApplicationController
  def index
  	@listings = Listing.all
    @message = Message.new
  end

  def index_json    
    @listings = Listing.all
    render :json => @listings.as_json(
                      :include => {
                        :area => {:only => [:name]},
                        :city => {:only => [:name]},
                        :user => {:only => [:id], :include => {:profile => {:only => [:first_name]}}}
                      })
  end
  def show
  	@listing = Listing.find(params[:id])
  	@pictures = @listing.pictures
  	@listings = Listing.all.limit(3)
  	@message = Message.new
  end


  def create
  	@listing = Listing.find(params[:message][:listing_id])
  	@message = @listing.messages.build(message_params)
  	if @message.save
  		@message.update_attributes(:user_id => @listing.user.id) 
  	end
  	redirect_to show_listing_url(@listing)
  end


  def message_params
  	 params.require(:message).permit(:listing_id,:name,:phoneno,:message)
  end
end
