require 'rails_helper'

describe 'As a user' do
  let!(:user) { stub_login_user }
  let!(:new_password) { "TestPass" }

  context 'I can reset my password' do
    it 'takes me to the verify page' do
      VCR.use_cassette(".by_verify_page") do

        user.update(verified: true)

        visit user_reset_password_path(user)
        fill_in :user_password, with: new_password
        click_on "Reset Password"

        expect(current_path).to eq(verify_path)
      end
    end

    it "takes me to a verify page to enter a code" do
      VCR.use_cassette(".by_verify") do
        allow_any_instance_of(Authy::Response).to receive(:ok?).and_return(true)
        allow(TwilioSender).to receive(:send_message).and_return(true)

        visit verify_path(user)
        click_on "Verify Token"

        expect(current_path).to eq(show_user_path(user.slug))
        expect(page).to have_content("Verified")
      end
    end

    it "resets my password" do
      VCR.use_cassette(".by_reset") do
        user.update(verified: true)

        allow_any_instance_of(Authy::Response).to receive(:ok?).and_return(true)
        allow(TwilioSender).to receive(:send_message).and_return(true)

        visit user_reset_password_path(user)
        fill_in :user_password, with: new_password
        click_on "Reset Password"
        click_on "Verify Token"

        click_on "Logout"
        visit login_path
        fill_in "Email", with: "brad@test.com"
        fill_in "Password", with: new_password
        click_button "Login"

        expect(page).to have_content(user.phone)
        expect(page).to have_content(user.email)
      end
    end
  end
end
