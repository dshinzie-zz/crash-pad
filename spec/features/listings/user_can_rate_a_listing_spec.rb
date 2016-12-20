require 'rails_helper'

describe "When a user clicks rate" do
  scenario "it shows the average rating of the listing" do
    user = stub_login_user
    user_1 = create(:user)
    user_2 = create(:user)
    listing = create(:listing)
    create(:rating, score: 5, user: user_1, listing: listing)
    create(:rating, score: 5, user: user_2, listing: listing)

    visit listing_path(listing)

    click_on "Terrible"

    expect(current_path).to eq(listing_path(listing))
    expect(page).to have_content("This listing has a Mediocre rating!")
  end
end
