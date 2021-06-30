# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :login, mutation: Mutations::Login
    field :sign_up, mutation: Mutations::SignUp
  end
end
