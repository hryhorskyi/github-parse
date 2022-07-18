# frozen_string_literal: true

# add repos column for table users
class AddReposToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :repos, :string
  end
end
