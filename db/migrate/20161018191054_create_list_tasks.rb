class CreateListTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :list_tasks do |t|
      t.integer :list_id
      t.integer :task_id
      t.integer :expiration, default: 1

      t.timestamps
    end
  end
end
