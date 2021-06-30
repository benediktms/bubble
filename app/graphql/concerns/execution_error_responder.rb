# frozen_string_literal: true

module ExecutionErrorResponder
  include ActiveSupport::Concern

  def execution_error(message, status = :unprocessable_entity, code = 422)
    GraphQL::ExecutionError.new(message, options: { status: status, code: code })
  end
end
