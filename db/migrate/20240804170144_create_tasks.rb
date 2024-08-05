class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :summary
      t.text :details
      t.integer :order
      t.boolean :promoted
      t.datetime :due_date

      t.timestamps
    end
  end
end
