class CreateRoomComments < ActiveRecord::Migration[5.2]
  def change
    create_table :room_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :room_id

      t.timestamps
    end
  end
end
