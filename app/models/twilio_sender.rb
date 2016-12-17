class TwilioSender
  def self.send_message(user, message)
    byebug
    twilio_number = ENV['TWILIO_NUMBER']
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    client.messages.create
      (
        from: twilio_number,
        to: "+1#{user.phone}",
        body: message
      )
  end
end
