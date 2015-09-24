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

  scenario 'visit bar show page' do
		bar = FactoryGirl.create(:bar)
    visit '/'
    click_link bar.title
    expect(page).to have_content(bar.address)
    expect(page).to have_content("Add Review")
  end

  scenario 'visit bar show page and add bar' do
		bar = FactoryGirl.create(:bar)
    visit '/'
    click_link bar.title
    expect(page).to have_content(bar.address)

    click_link "Add Review"
    fill_in 'review[rating]', with: '5'
    fill_in 'review[body]', with: 'good'

    click_button 'Create Review'
    expect(page).to have_content("Review")
    expect(page).to have_content("good")
  end

end
