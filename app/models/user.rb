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

  validates_presence_of :name
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    presence: true, uniqueness: true
  validates_presence_of :password_digest
end
