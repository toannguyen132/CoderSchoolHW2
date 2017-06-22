class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.integer :sender_id
      t.integer :recipient_id
      t.timestamp :read_at
      t.boolean :is_read

      t.timestamps
    end
  end
end
