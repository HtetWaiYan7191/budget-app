require 'rails_helper'

RSpec.describe 'category purchases index ' do
  before :each do
    login_user
  end

  it 'see the category name ' do
    visit category_purchases_path(@category.id)
    expect(page).to have_content(@category.name)
  end

  it 'see the purchaes create date ' do
    visit category_purchases_path(@category.id)
    expect(page).to have_content(@purchase.created_at.strftime('%d-%m-%Y'))
  end

  it 'see the total price' do
    visit category_purchases_path(@category.id)
    expect(page).to have_content(@purchases.sum(:amount))
  end

  it 'see the total amount text ' do
    visit category_purchases_path(@category.id)
    expect(page).to have_content('Total Amount:')
  end
end
