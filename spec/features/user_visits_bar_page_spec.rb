require 'rails_helper'

feature 'user visits show page', %Q{
  As a visitor
  I want to click on a bar title
  So that I can see all the details of that bar
} do

  # Acceptance Criteria:
  # * I must see a bars details when I visit bar/:id
  # * If I am on the show page for a bar I should be
  #   able to see reviews, if any exist

  scenario 'visit root page and see list of bars' do
		bar = FactoryGirl.create(:bar)
    visit '/'
# save_and_open_page
    click_link bar.title
    expect(page).to have_content(bar.address)
    expect(page).to have_content("Add Review")

    expect(page).to have_content(bar.title)
    expect(page).to_not have_content(bar.address)
  end

end
