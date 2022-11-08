class RenameUsersToAuthors < ActiveRecord::Migration[7.0]
  def change
    rename_table :users, :authors
  end
end
