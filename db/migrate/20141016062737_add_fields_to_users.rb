class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string

    add_column :users, :uid, :string

    add_column :users, :provider, :string

    add_column :users, :admin, :boolean, :default => false

    add_column :users, :oauth_token, :string

    add_column :users, :oauth_expires_at, :datetime

  end
end
