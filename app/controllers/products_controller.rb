class ProductsController < ApplicationController
  def index
    @products = Product.order(:created_at)
    @off_shelf_products = Product.only_deleted.order(:created_at)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_url
    else
      render 'edit'
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
   
    redirect_to products_url
  end

  def on_shelf
    product = Product.with_deleted.find(params[:id])
    product.restore
   
    redirect_to products_url
  end

  def search
    search = Product.search do
      fulltext params[:q]
    end
    @products = search.results
  end

  def add_to_order
    product = Product.find(params[:id])
    if product && params[:amount].to_i > 0 && ! is_in_cart?(params[:id])
      item = { :product_id => params[:id], :product => Product.find(params[:id]).name, :amount => params[:amount] }
      session[:items] ||= []
      session[:items] << item
    end
    redirect_to new_order_url
  end

private

  def product_params
    params.require(:product).permit(:name, :price, :description)
  end

  def is_in_cart?(id)
    items = session[:items]
    items.each do |item|
      if (item['product_id'] == id)
        return true
      end
    end
    return false
  end
end
