class RemoveUsersIdFromOperations < ActiveRecord::Migration[7.0]
  def change
    remove_column :operations, :users_id
  end
end
