class CreateChatRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :chat_rooms do |t|
      t.string :title
      t.references :owner, foreign_key: true
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
