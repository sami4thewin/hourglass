class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :link
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
