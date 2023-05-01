class HomeController < ApplicationController

    def index 
    end

    def dropdown
       @product= Product.find(params[:product])
       @detail = Detail.where(product_id: @product)
       detail= @detail.map{ |d| [d.color, d.id]  }
       respond_to do |format|
          format.json { render json: detail }
       end
    end
        
    def show_data
        @product= Product.find(params[:hour_product_id])
        @detail_ids = params[:detail_ids]
    end
end
