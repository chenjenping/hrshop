require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'create new product' do
        post :create, product: attributes_for(:product)
        expect(Product.count).to eq(1)
      end
    end
    # context 'with invalid attributes' do
    #   it 'does not create a new product' do
    #     post :create, product: attributes_for(:invalid_product)
    #     expect(Product.count).to eq(0)
    #   end
    # end
  end
end