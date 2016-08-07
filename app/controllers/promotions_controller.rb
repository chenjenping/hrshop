class PromotionsController < ApplicationController
  def new
    @product_id = params[:product_id]
    @promotion = Promotion.new
  end

  def create
    product = Product.find(params[:product_id])
    @product_id = product.id
    @promotion = Promotion.new(promotion_params)
    product.promotions << @promotion
    if product.save
      redirect_to products_url
    else
      render 'new'
    end
  end

private

  def promotion_params
    params.require(:promotion).permit(:amount, :discount)
  end
end
