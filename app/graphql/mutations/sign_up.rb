# frozen_string_literal: true

require_relative '../concerns/execution_error_responder'

module Mutations
  class SignUp < Mutations::BaseMutation
    include ExecutionErrorResponder

    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    field :user, Types::UserType, null: true
    field :message, String, null: true

    def resolve(**args)
      result = sign_up_user(args)

      if result.success?
        result
      else
        result.error.map do |e|
          execution_error(e)
        end
      end
    end

    private

    def sign_up_user(params)
      ::Users::SignUpInteractor.call(attributes: params)
    end
  end
end
