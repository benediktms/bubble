# frozen_string_literal: true

module Mutations
  class SignUp < Mutations::BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    field :user, Types::UserType, null: true
    field :token, String, null: true
    field :message, String, null: true
    field :errors, [String], null: true

    def resolve(**args)
      result = sign_up_user(args)

      if result.success?
        result
      else
        result.errors.map do |e|
          GraphQL::ExecutionError.new(e)
        end
      end
    end

    private

    def sign_up_user(params)
      ::Users::SignUpInteractor.call(attributes: params)
    end
  end
end
