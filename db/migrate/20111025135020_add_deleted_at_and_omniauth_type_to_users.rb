class AddDeletedAtAndOmniauthTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :deleted_at, :timestamp
    add_column :users, :omniauth_type, :string
  end
end
