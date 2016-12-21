describe "Delete Reviews Request" do
  let!(:user) { create(:user) }
  let!(:listing) { create(:listing) }
  let!(:review) { create(:review, user: user, listing: listing) }

  it 'can be deleted through the api' do
    get "/api/v1/listings/#{listing.id}/reviews/#{review.id}.json?api_key=#{user.api_key}"
    parsed = JSON.parse(response.body)

    expect(response).to be_success
    expect(Review.count).to eq(1)

    delete "/api/v1/listings/#{listing.id}/reviews/#{review.id}.json?api_key=#{user.api_key}"

    expect(response).to be_success
    expect(Review.count).to eq(0)
  end

  it "does not delete a review for unauthenticated user" do
    user = create(:user)
    listing = create(:listing)

    delete "/api/v1/listings/#{listing.id}/reviews/#{review.id}.json?api_key=nottherightkey"

    expect(response.status).to be(403)
  end

end
