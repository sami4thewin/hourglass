class CreateUserLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_links do |t|
      t.integer :user_id
      t.integer :link_id
      t.integer :expiration, default: 1

      t.timestamps
    end
  end
end
