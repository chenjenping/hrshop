class Order < ActiveRecord::Base
  validates :purchaser, :phone, :email, :address, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  searchable do
    text :purchaser, :phone, :email, :address
    text :items do
      order_items.map { |item| item.product.name }
    end
  end

  has_many :order_items
end
