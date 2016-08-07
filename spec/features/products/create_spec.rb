require 'rails_helper'

RSpec.feature 'Product', :type => :feature do
  scenario 'Create a new product' do
    visit '/products/new'

    fill_in '名稱', :with => 'test'
    fill_in '價格', :with => '100'
    fill_in '介紹', :with => 'go went gone'

    click_button '新增'

    expect(page).to have_text('go went gone')
  end
end