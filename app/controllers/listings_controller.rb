class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]
  # after_action :send_email_notification, only: [:create]
  before_action :set_data
  # GET /listings
  # GET /listings.json
  def index
    @listings = current_user.listings 
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
  end

  def set_data
    @amenities = Amenity.all
    @rules = Rule.all
  end

  # GET /listings/new
  def new
    @listing = Listing.new   
    @pictures = @listing.pictures
  end

  # GET /listings/1/edit
  def edit
   
  end

  # POST /listings
  # POST /listings.json
  def create
     @listing = current_user.listings.build(listing_params)

    respond_to do |format|
      if @listing.save

        if params[:pictures]
        #===== The magic is here ;)
          params[:pictures].each { |image|
            @listing.pictures.create(file: image)
          }
        end
        ListingMailer.email_notification(current_user,@listing).deliver
        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update

    respond_to do |format|
      if @listing.update_attributes(listing_params)
         if params[:pictures]
        #===== The magic is here ;)
          params[:pictures].each { |image|            
            @listing.pictures.create(file: image)
          }       
        end
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


   def delpic
    @pic = Picture.find(params[:pid])
    @listing = Listing.find(params[:lid])
    @pic.destroy
    redirect_to edit_listing_path(@listing)
  end


  def upvote
    @listing = Listing.find_by_id(params[:id])
    @listing.upvote_from current_user
    redirect_to show_listing_path(@listing)
  end

  def downvote
    @listing = Listing.find_by_id(params[:id])
    @listing.downvote_from current_user
    redirect_to show_listing_path(@listing)
  end

  def send_email_notification
    ListingMailer.email_notification(current_user,@listing).deliver
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
      @amenities = Amenity.all
      @rules = Rule.all
      @pictures = @listing.pictures
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title,:description,:room_type,:bedrooms,:rent,:rooms_for_rent,:available_from,:minimumstay,:current_roommates,:prefred_gender,:prefred_age, :prefred_occupation,:phonenumber_visibility,:visible_status,:verified_status,:security_deposit,:furnishing_status,:landmark,:user_id,:area_id,:city_id,:rule_ids => [],:amenity_ids => [])
    end
end
