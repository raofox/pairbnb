class TagsController < ApplicationController
  # before_action :find_tag, only: [:destroy, :show]
  # def index
  #
  # end

  def show
    @tag = Tag.find(params[:id])
    @list = @tag.listings
  end

  # def edit
  #   @set_tag = Tag.new
  # end

#   def update
#     @set_tag = Tag.new(tag_params)
#     if @set_tag.save
#     end
#   end


  # def destroy
  #   @set_tag.delete
  # end
  #
  #
  # private
  # def tag_params
  #   params.require(:amenity).permit(:amenity)
  # end

end
