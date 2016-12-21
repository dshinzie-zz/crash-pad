require 'rails_helper'

describe "reviews crud API" do
  it "creates a review for authenticated user" do
    user = create(:user)
    listing = create(:listing)

    params = {'body' => 'a new review',
              'CONTENT_TYPE' => 'application/json',
              'ACCEPT' => 'application/json'}

    post "/api/v1/listings/#{listing.id}/reviews.json?api_key=#{user.api_key}", params: params

    parsed = JSON.parse(response.body)
    expect(response).to be_success
    expect(parsed["body"]).to eq('a new review')
  end

  it "does not create a review for unauthenticated user" do
    user = create(:user)
    listing = create(:listing)

    params = {'body' => 'a new review',
              'CONTENT_TYPE' => 'application/json',
              'ACCEPT' => 'application/json'}

    post "/api/v1/listings/#{listing.id}/reviews.json?api_key=nottherightkey", params: params

    parsed = JSON.parse(response.body)
    expect(response.status).to be(403)
  end
end
