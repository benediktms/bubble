# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create({
                       email: 'test@example.com',
                       password: 'password123',
                       password_confirmation: 'password123'
                     })

  it('should correctly create a user') do
    expect(user).to be_instance_of(User)
  end
end
