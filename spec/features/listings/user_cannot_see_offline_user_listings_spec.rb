require 'rails_helper'

describe 'A logged-in user' do
  let!(:listings) { create_list(:listing, 3) }
  let!(:user) { create(:user) }
  it "cannot see offline user listings" do

  id_before_offline = Listing.first.id

  visit listings_path

  expect(page).to have_xpath("//a[@href='/listings/#{id_before_offline}']")

  User.first.offline!

  visit listings_path

  expect(page).not_to have_xpath("//a[@href='/listings/#{id_before_offline}']")

  end
end
