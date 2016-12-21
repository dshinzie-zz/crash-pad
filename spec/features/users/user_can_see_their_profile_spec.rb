require 'rails_helper'

describe 'As a logged in user' do
  context 'When I visit my user show page' do
    it "shows my verfication status, email, first name, last name, phone" do
      user = stub_login_user

      visit user_path(user)

      expect(page).to have_content(user.verified)
      expect(page).to have_content(user.email)
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.last_name)
      expect(page).to have_content(user.phone)
      expect(page).to have_content("Edit Profile")
    end
  end
end
