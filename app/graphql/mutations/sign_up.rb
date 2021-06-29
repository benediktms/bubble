# frozen_string_literal: true

module Mutations
  class SignUp < BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    field :response, Types::SignUpResponseType, null: true

    def resolve(**args)
      params = Hash(args)

      begin
        user = User.create!(params)

        {
          user: user,
          success: true,
          message: 'Sign up successful'
        }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
