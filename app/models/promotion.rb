class Promotion < ActiveRecord::Base
  validates_presence_of :amount, :discount
  belongs_to :product
end
