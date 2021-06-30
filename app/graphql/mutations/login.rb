# frozen_string_literal: true

require_relative '../concerns/execution_error_responder'

module Mutations
  class Login < BaseMutation
    include ExecutionErrorResponder

    argument :email, String, required: false
    argument :password, String, required: false

    field :user, Types::UserType, null: true
    field :message, String, null: false

    def resolve(email:, password:)
      result = login_user(email, password)

      if result.success?
        result
      else
        result.errors.map do |e|
          execution_error(e)
        end
      end
    end

    private

    def login_user(email, password)
      ::Users::LoginInteractor.call(email: email, password: password)
    end
  end
end
