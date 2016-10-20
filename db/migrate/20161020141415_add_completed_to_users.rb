class AddCompletedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :completed, :integer, default: 0
  end
end
