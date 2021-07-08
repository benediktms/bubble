# frozen_string_literal: true

module Users
  class LoginInteractor < BaseInteractor
    delegate :email, :password, to: :context

    def call
      return unless password

      user = User.find_by(email: email)
      return context.fail! error: "Invalid credentials. Please try again" unless user

      if user.authenticate(password)
        user.token = user.generate_token
        user.save
        binding.pry

        context.message = "Successfully logged in"
        context.user = user
        context.token = user.token
      else
        context.fail! error: "Login failed"
      end
    end
  end
end
