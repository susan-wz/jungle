require 'rails_helper'

RSpec.feature "User can add an item to cart and cart will increase by 1", type: :feature, js:true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can click on the add to cart button and it increases the cart by 1" do
    # ACT
    visit root_path
    click_button("Add", match: :first)

    # DEBUG
    # save_and_open_screenshot

    # VERIFY
    expect(page).to have_text "My Cart (1)"
    # puts page.html
  end

end
