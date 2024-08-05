class AddCompleteToTasks < ActiveRecord::Migration[7.1]
  def change
    add_column :tasks, :complete, :boolean
  end
end
