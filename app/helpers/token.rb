# frozen_string_literal: true

module Token
  def self.generate(user_id)
    payload = { id: user_id, exp: 30.days.from_now.to_i }
    hmac_secret = Rails.application.secrets.secret_key_base

    JWT.encode(payload, hmac_secret, "HS256")
  end
end
