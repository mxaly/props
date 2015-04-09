class RemoveUserIdFromProps < ActiveRecord::Migration
  def change
    remove_column :props, :user_id
  end
end
