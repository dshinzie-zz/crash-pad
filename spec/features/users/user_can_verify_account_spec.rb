require 'rails_helper'

describe "As a user" do
  let(:user) { create(:user) }
  context "I can see whether my account is verified" do
    it "shows the user information" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.verified)
    end
  end

  context "I can verify an unverified account" do
    it "verifies the account" do
      verified = Authy::Response.new({"message"=>"Token is valid.", "token"=>"is valid", "success"=>"true"})
      stub_login_user

      allow_any_instance_of(Authy::Response).to receive(:ok?).and_return(true)
      allow(TwilioSender).to receive(:send_message).and_return(true)

      visit verify_path(user)
      click_on "Verify Token"

      expect(current_path).to eq(user_path(User.first))
      expect(page).to have_content("Verified")
    end
  end
end
