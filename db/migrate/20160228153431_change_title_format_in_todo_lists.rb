class ChangeTitleFormatInTodoLists < ActiveRecord::Migration
  def up
    change_column :todo_lists, :title, :string
  end

  def down
    change_column :todo_lists, :title, :integer
  end
end
