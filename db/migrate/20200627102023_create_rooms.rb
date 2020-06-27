class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.text :condition
      t.string :link
      t.integer :living_status

      t.timestamps
    end
  end
end
