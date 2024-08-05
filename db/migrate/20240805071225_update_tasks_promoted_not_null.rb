class UpdateTasksPromotedNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :tasks, :promoted, false, false
    change_column_default :tasks, :promoted, false
  end
end
