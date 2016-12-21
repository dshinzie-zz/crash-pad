require 'rails_helper'

describe "reviews crud API" do
  it "returns a list of reviews for authenticated user" do

  user = create(:user)
  listing = create(:listing)
  review1 = create(:review, user: user, listing: listing)
  review2 = create(:review, user: user, listing: listing)

  get "/api/v1/listings/#{listing.id}/reviews.json?api_key=#{user.api_key}"
  parsed = JSON.parse(response.body)

  expect(response).to be_success
  expect(parsed.count).to eq(2)

  end
  it "does not return a list of reviews for unauthenticated user" do

  user = create(:user)
  listing = create(:listing)
  review1 = create(:review, user: user, listing: listing)
  review2 = create(:review, user: user, listing: listing)

  get "/api/v1/listings/#{listing.id}/reviews.json?api_key=nottherightkey"

  expect(response.status).to eq(403)

  end

end
