# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  token           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    presence: true, uniqueness: true

  def generate_token
    payload = { id: id, exp: 30.days.from_now.to_i }
    hmac_secret = Rails.application.secrets.secret_key_base

    JWT.encode(payload, hmac_secret)
  end
end
