require 'rails_helper'

feature 'user visits show page', %Q{
  As a visitor
  I want to click on a bar title
  So that I can see all the details of that bar
} do

  # Acceptance Criteria:
  # * I must see a bars details when I visit bar/:id
  # * If I am on the show page for a bar I should be
  #   able to see a link to add a review

  scenario 'visit bar show page' do
		bar = FactoryGirl.create(:bar)
    visit '/'
    click_link bar.title
    expect(page).to have_content(bar.address)
    expect(page).to have_content(bar.description)
    expect(page).to have_content(bar.price_range)
    expect(page).to have_content("Add Review")
  end
end
