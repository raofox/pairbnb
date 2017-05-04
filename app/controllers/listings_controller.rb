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
    @reservation = @listing.reservations.new
  end

  def new
    # # authorization code
    # user = User.find(current_user.id)
    # if user.customer?
    #   flash[:notice] = "Sorry. You are not allowed to perform this action."
    #   return redirect_to listings_path, notice: "Sorry. You do not have the permission to verify a property."
    # end
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    byebug
    # @listing.user_id = current_user.id

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
      params.require(:listing).permit(:room_type, :property_type, :guest, :bedroom, :bathroom, :title, :summary, :address, :price, { :tag_ids => []}, { :photos => []})
  end

end
