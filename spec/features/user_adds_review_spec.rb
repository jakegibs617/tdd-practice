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

  scenario 'visit bar show page and add review' do
		bar = FactoryGirl.create(:bar)
		review = FactoryGirl.create(:review)
    visit '/'
    click_link bar.title
    expect(page).to have_content(bar.address)

    click_link "Add Review"
    fill_in 'review[rating]', with: review.rating
    fill_in 'review[body]', with: review.body

    click_button 'Create Review'
    expect(page).to have_content("3")
    expect(page).to have_content("good")
  end

end
