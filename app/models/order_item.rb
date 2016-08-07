class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product, -> { with_deleted }
end
