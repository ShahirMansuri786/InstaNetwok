class CreateChatMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :chat_messages do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.text :content

      t.timestamps
    end
  end
end
