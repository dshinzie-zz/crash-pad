require 'rails_helper'

describe "As a logged-in user When I visit a listings show page" do
  scenario "I can create a review on it" do
    listing = create(:listing)
    user_1 = stub_login_user

    visit listing_path(listing.id)

    fill_in 'Review', with: 'Hey you guys'
    click_on 'Add Review'

    expect(current_path).to eq(listing_path(listing.id))
    expect(page).to have_content("Hey you guys")
  end
end
