require 'rails_helper'

describe 'TwilioSend' do
  context '#send_message' do
    it "sends a message" do
      VCR.use_cassette(".by_twilio") do
        user = create(:user, phone:'214-578-7335')
        message = "This is a crashPad test run by rspec"
        sent_message = TwilioSender.send_message(user, message)

        expect(sent_message.class).to eq(Twilio::REST::Message)
      end
    end
  end
end
