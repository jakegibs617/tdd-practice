require 'rails_helper'

feature 'user visits root page', %Q{
  As a visitor
  I want to see all bars at the home page
  So that I can if I want click on a bar to see more info
} do

  # Acceptance Criteria:
  # * I must see a list of all bars at the home page
  # * If I click on a bar I should be brought to a detail page for that bar

  scenario 'visit root page and see list of bars' do
		bar = FactoryGirl.create(:bar)
    visit '/'
    expect(page).to have_content(bar.title)
    expect(page).to_not have_content(bar.address)
  end

end
