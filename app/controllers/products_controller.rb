class ProductsController < ApplicationController
    
    def index
       @products = Product.all 
    end
    
    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(product_params)
        @product.save
        redirect_to products_path
    end
    
    def show
      @product = Product.find(params[:id])
    end
    
    def add_to_cart
      @order_product = OrderProduct.new(params)
      @order_product.save
      render 'index'
    end
    
    private
    
    def product_params
      params.require(:product).permit(:name, :price, :volume, :availability, order_products_attributes: [:id, :quantity])
    end
    
end
