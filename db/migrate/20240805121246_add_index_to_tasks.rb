class AddIndexToTasks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tasks, :order, false
    add_index :tasks, :order, unique: true
  end
end
