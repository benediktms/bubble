# frozen_string_literal: true

module Users
  class SignUpInteractor < BaseInteractor
    delegate :attributes, to: :context

    def call
      user = User.create(**attributes)

      if user.persisted?
        context.user = user
        context.message = "You have successfully signed up"
      else
        context.fail! errors: user.errors.full_messages, user: nil, message: nil
      end
    end
  end
end
