require 'rails_helper'

describe Product, type: :model do
  it 'has a valid factory' do
    product = build(:product)
    expect(product).to be_valid
  end

  describe Product do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:description) }
  end
end