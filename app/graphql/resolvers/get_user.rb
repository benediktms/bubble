# frozen_string_literal: true

module Resolvers
  class GetUser < Resolvers::BaseResolver
    type Types::UserType, null: true

    argument :id, ID, required: true

    def resolve(id:)
      User.find(id)
    end
  end
end
