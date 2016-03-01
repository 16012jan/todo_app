class RemoveCompletedAtFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :completed_at, :datetime
  end
end
