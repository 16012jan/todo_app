class AddTodoListIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :todo_list_id, :integer
  end
end
