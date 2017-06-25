class CreateBlockedUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :blocked_users do |t|
      t.references :user, foreign_key: true
      t.integer :blocked_user_id

      t.timestamps
    end
  end
end
