class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :task_number
      t.date :date, :default => Date.today
      t.integer :status, default: 0
      t.text :comment
      t.timestamps
    end
  end
end
