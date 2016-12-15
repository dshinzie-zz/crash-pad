require 'rails_helper'

describe 'As a logged-out user' do
  let!(:listings) { create_list(:listing, 2) }

  context 'when I click take a trip' do
    it "see all trips" do
      visit root_path
      click_on "Take a Trip"

      expect(current_path).to eq(listings_path)
      expect(page).to have_content(listings.first.description)
      expect(page).to have_content(listings.second.description)
    end
  end
end

describe 'As a logged-in' do
  let!(:listings) { create_list(:listing, 2) }
  let(:user) { create(:user) }

  context 'when I click take a trip' do
    it "see all trips" do
      visit listings_path

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      expect(current_path).to eq(listings_path)
      expect(page).to have_content(listings.first.description)
      expect(page).to have_content(listings.second.description)
    end
  end
end
