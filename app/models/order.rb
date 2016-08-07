class Order < ActiveRecord::Base
	validates :purchaser, :phone, :email, :address, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

	has_many :order_items
end
