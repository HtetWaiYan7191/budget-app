require 'rails_helper'

RSpec.describe 'categories index ' do
  before :each do
    login_user
  end

  it 'see the title in navbar ' do
    visit authenticated_root_path
    expect(page).to have_content('categories')
  end

  it 'see the category name ' do
    visit authenticated_root_path
    expect(page).to have_content(@category.name)
  end

  it 'see the purchase price for this category' do
    visit authenticated_root_path
    expect(page).to have_content(@purchases.sum(:amount))
  end

  it 'see the icon' do
    visit authenticated_root_path
    expect(page).to have_content('icon')
  end

  it 'see the add category button ' do
    visit authenticated_root_path
    expect(page).to have_link('ADD CATEGORY')
  end

  it 'when click add category should go to the new page' do
    visit authenticated_root_path
    click_on 'ADD CATEGORY'
    expect(page).to have_content('Select an icon')
  end
end
