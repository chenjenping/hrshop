class Product < ActiveRecord::Base
  acts_as_paranoid

  validates_presence_of :name, :price, :description

  searchable do
    text :name, :description
  end

  has_many :order_items
  has_many :promotions, -> { order 'created_at desc' }

  def is_on_shelf?
    return ! deleted?
  end

  def current_promotion
    return promotions.first
  end
end
