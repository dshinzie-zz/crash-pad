require 'rails_helper'

describe 'Edit Reviews Request' do
  let!(:user) { create(:user) }
  let!(:listing) { create(:listing) }
  let!(:review) { create(:review, user: user, listing: listing) }

  it 'can be edited through the api' do
    get "/api/v1/listings/#{listing.id}/reviews/#{review.id}.json?api_key=#{user.api_key}"
    parsed1 = JSON.parse(response.body)

    expect(response).to be_success

    params = {'body' => 'Daniel just editted this',
              'CONTENT_TYPE' => 'application/json',
              'ACCEPT' => 'application/json'}

    put "/api/v1/listings/#{listing.id}/reviews/#{review.id}.json?api_key=#{user.api_key}", params: params
    get "/api/v1/listings/#{listing.id}/reviews/#{review.id}.json?api_key=#{user.api_key}"
    parsed2 = JSON.parse(response.body)

    expect(parsed2.class).to eq(Hash)
    expect(response).to be_success
    expect(parsed1).to_not eq(parsed2)
  end

  it "does not edit a review for unauthenticated user" do
    user = create(:user)
    listing = create(:listing)

    params = {'body' => 'Daniel just editted this',
              'CONTENT_TYPE' => 'application/json',
              'ACCEPT' => 'application/json'}

    put "/api/v1/listings/#{listing.id}/reviews/#{review.id}.json?api_key=nottherightkey", params: params

    expect(response.status).to be(403)
  end

end
