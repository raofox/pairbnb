class ListingsController < ApplicationController
#
#     listings GET    /listings(.:format)                     listings#index
#             POST   /listings(.:format)                     listings#create
#  new_listing GET    /listings/new(.:format)                 listings#new
# edit_listing GET    /listings/:id/edit(.:format)            listings#edit
#      listing GET    /listings/:id(.:format)                 listings#show
#            PATCH  /listings/:id(.:format)                 listings#update
#              PUT    /listings/:id(.:format)                 listings#update
#           DELETE /listings/:id(.:format)                 listings#destroy


  def index
    @listing = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.save
        redirect_to @listing
    else
        render 'new'
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to @listing
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to listings_path
  end


  private
  def listing_params
      params.require(:listing).permit(:room_type, :property_type, :guest, :bedroom, :bathroom, :title, :summary, :address, :price)
  end

end
