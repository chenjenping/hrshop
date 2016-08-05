class Product < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :order_item

  def is_on_shelf?
    return ! deleted?
  end
end
