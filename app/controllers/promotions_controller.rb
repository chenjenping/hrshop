class PromotionsController < ApplicationController
  def new
    @product_id = params[:product_id]
    @promotion = Promotion.new
    promotion = Promotion.where(product_id: @product_id).order(created_at: :desc).first
    if promotion
      @promotion.amount = promotion.amount
      @promotion.discount = promotion.discount
    end
  end

  def create
    product = Product.with_deleted.find(params[:product_id])
    @product_id = product.id
    promotion = product.current_promotion
    @promotion = Promotion.new(promotion_params)
    if promotion && promotion.amount == @promotion.amount && promotion.discount == @promotion.discount
      redirect_to products_url and return
    end

    product.promotions << @promotion
    if product.save
      redirect_to products_url
    else
      render 'new'
    end
  end

private

  def set_active_tab
    @active_tab = { :products => ' is-active', :orders => '' }
  end

  def promotion_params
    params.require(:promotion).permit(:amount, :discount)
  end
end
