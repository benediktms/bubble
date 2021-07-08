# frozen_string_literal: true

require_relative "../../helpers/token"

module Users
  class LoginInteractor < BaseInteractor
    include Token

    delegate :email, :password, to: :context

    def call
      return unless password

      user = User.find_by(email: email)

      return context.fail! error: "Invalid credentials. Please try again" unless user

      if user.authenticate(password)
        user.token = Token.generate(user.id)
        user.save

        context.message = "Successfully logged in"
        context.user = user
        context.token = Token.generate(user.id)
      else
        context.fail! error: "Login failed"
      end
    end
  end
end
