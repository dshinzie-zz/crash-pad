class AuthyUser

  def self.get_registered_user(user)
    authy = Authy::API.register_user(email: user.email, cellphone: user.phone, country_code: "1")
    user.update(authy_id: authy.id)
    user
  end

  def self.get_verified_user(user, token)
    Authy::API.verify(id: user.authy_id, token: token)
  end

  def self.get_requested_sms(user)
    Authy::API.request_sms(id: user.authy_id)
  end

  def self.update_verified_user(user)
    user.update(verified: true)
    TwilioSender.send_message(user, "You did it! Signtup Complete :)")
  end

end
