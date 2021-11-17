require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
  # #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  'product name',
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can add a product to cart" do
    #ACT
    visit root_path
    click_on 'Add'

    expect(page).to have_content '(1)'
    save_screenshot
  end

end


  # #SETUP
  # before :each do
  #   @category = Category.create! name: 'Apparel'

  #   1.times do |n|
  #     @category.products.create!(
  #       name:  'product name',
  #       description: Faker::Hipster.paragraph(4),
  #       image: open_asset('apparel1.jpg'),
  #       quantity: 10,
  #       price: 64.99
  #     )
  #   end
  # end

  # scenario "They click into a product" do
  #   #ACT
  #   visit root_path
  #   click_on 'product name'
  #   #DEBUG 
  #   expect(page).to have_css '.products-show'
  #   # save_and_open_screenshot
  #   # puts page.html
  # end