require 'rails_helper'

describe 'As a logged in user' do
  context 'When I visit my user show page' do
    it "shows my verfication status, email, first name, last name, phone" do
      user = stub_login_user

      user.update(verified: true)

      visit show_user_path(user.slug)

      expect(page).to have_content("Verified")
      expect(page).to have_content(user.email)
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.last_name)
      expect(page).to have_content(user.phone)
      expect(page).to have_button("Edit Profile")
    end
  end
end
