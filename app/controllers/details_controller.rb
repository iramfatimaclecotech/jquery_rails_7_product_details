class DetailsController < ApplicationController

  def index
    @details = Detail.all
  end
  def show
   
    @product = Product.find(params[:product_id])
    @detail = Detail.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    @detail = Detail.new
  end

  def create
    @product = Product.find(params[:product_id])
    @detail = @product.details.create(detail_params)
    if @detail.save
      respond_to do |format|
        format.js { flash[:info] = "The detail with a Product of #{@product.id} has created!" }
      end
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @detail = Detail.find(params[:id])
    @detail.destroy
    
  end

  private
    def detail_params
      params.require(:detail).permit(:description, :size,:color,:product_id)
    end
end
