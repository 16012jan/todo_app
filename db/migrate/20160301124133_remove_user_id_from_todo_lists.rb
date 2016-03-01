class RemoveUserIdFromTodoLists < ActiveRecord::Migration
  def change
    remove_column :todo_lists, :user_id, :integer
  end
end
