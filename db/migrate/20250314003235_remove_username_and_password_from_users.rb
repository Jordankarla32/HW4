class RemoveUsernameAndPasswordFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :username, :string
    remove_column :users, :password, :string
  end
end
