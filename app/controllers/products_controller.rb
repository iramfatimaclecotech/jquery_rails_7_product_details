class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      respond_to do |format|
        format.js { flash[:info] = "The article with an ID of #{@product.id} has had their admin attribute toggled!" }
      end
      
    end
  end

  def delete_all
    respond_to do |format|
     @products = Product.where(id: params[:product_ids])
      @products.delete_all
       format.js
     end
  end


  def destroy
    @product = params[:id].each do |id|
        product.find(id.to_i).destroy
      end
    
  end

  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
