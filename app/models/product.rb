class Product < ActiveRecord::Base
  acts_as_paranoid

  searchable do
    text :name, :description
  end

  belongs_to :order_item

  def is_on_shelf?
    return ! deleted?
  end
end
