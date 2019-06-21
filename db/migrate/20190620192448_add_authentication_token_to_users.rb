class AddAuthenticationTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :v1, :authentication_token, :string, limit: 30
    add_index :v1, :authentication_token, unique: true
  end
end
