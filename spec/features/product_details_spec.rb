require 'rails_helper'

RSpec.feature "Product Details", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'


      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end


  # scenario block => it block
  scenario "They see all products and click the first one to see product details" do
    # ACT
    visit root_path
    click_on 'Details'


    # DEBUG
    save_screenshot


    visit '/products/1'
    save_screenshot

    #VERIFY
    expect(page).to have_css 'section.products-show'
  end

end 