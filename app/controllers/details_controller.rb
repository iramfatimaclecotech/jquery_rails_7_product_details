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
        format.js { flash[:info] = "The article with an ID of #{@product.id} has had their admin attribute toggled!" }
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
      params.require(:detail).permit(:discription, :size,:color,:product_id)
    end
end
