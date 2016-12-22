require 'rails_helper'

describe 'TwilioSend' do
  context '#send_message' do
    it "sends a message", :vcr do
      user = create(:user, phone:'214-578-7335')
      message = "This is a crashPad test run by rspec"
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      sent_message = TwilioSender.send_message(user, message)

      expect(sent_message.class).to eq(Twilio::REST::Message)
    end
  end
end
