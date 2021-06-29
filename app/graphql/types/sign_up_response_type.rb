# frozen_string_literal: true

module Types
  class SignUpResponseType < Types::BaseObject
    field :user, Types::UserType, null: true
    field :success, Boolean, null: true
    field :message, String, null: true
  end
end
