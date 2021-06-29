# frozen_string_literal: true

class AddAuthTokenToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :token, :string, null: true, default: nil
  end
end
