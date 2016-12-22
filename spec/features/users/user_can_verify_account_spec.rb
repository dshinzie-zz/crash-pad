require 'rails_helper'

describe "As a user" do
  let(:user) { create(:user, verified: true) }
  context "I can see whether my account is verified" do
    it "shows the user information" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit show_user_path(user.slug)

      expect(page).to have_content(user.first_name)
      expect(page).to have_content("Account Status: Verified")
    end
  end

  context "I can verify an unverified account" do
    it "verifies the account" do
      stub_login_user

      allow_any_instance_of(Authy::Response).to receive(:ok?).and_return(true)
      allow(TwilioSender).to receive(:send_message).and_return(true)

      visit verify_path(User.first)
      click_on "Verify Token"

      expect(current_path).to eq(show_user_path(User.first.slug))
      expect(page).to have_content("Verified")
    end
  end

  context "I can't use a bad code" do
    it "displays a flash message" do
      stub_login_user

      visit verify_path(User.first)
      fill_in "token", with: 123
      click_on "Verify Token"

      expect(current_path).to eq(verify_path)
      expect(page).to have_content("Incorrect code, please try again")
    end
  end

  context "I can resend a code" do
    it "resends a verification code" do
      stub_login_user

      visit verify_path(User.first)
      click_on "Resend code"

      expect(current_path).to eq(verify_path)
      expect(page).to have_content("Verification code re-sent")
    end
  end

end
