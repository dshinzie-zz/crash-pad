require 'rails_helper'

describe 'A logged-in user' do

  let!(:user) { create(:user) }
  let!(:listings) { create_list(:listing, 3, user: user) }

  it "cannot see offline user listings" do

    id_before_offline = listings.first.id

    visit listings_path

    expect(page).to have_xpath("//a[@href='/listings/#{id_before_offline}']")

    user.offline!

    visit listings_path

    expect(page).not_to have_xpath("//a[@href='/listings/#{id_before_offline}']")

  end
end
