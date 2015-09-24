require 'rails_helper'

feature 'user visits home page', %Q{
  As a visitor
  I want to add a new bar
  So that others can see all the details of that bar
} do

  # Acceptance Criteria:
  # * I must see a link to add a bar

  scenario 'add bar to db' do
		bar = FactoryGirl.build(:bar)
    visit '/'
    click_link "Add Bar"
    fill_in 'bar[title]', with: bar.title
    fill_in 'bar[address]', with: bar.address
    fill_in 'bar[city]', with: bar.city
    fill_in 'bar[state]', with: bar.state
    fill_in 'bar[zip_code]', with: bar.zip_code

    click_button 'Save Bar'
    expect(page).to have_content("43 Lemon St")
  end
end
