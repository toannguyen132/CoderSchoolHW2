class ChangeDefaultForMessages < ActiveRecord::Migration[5.1]
  def change
    change_table :messages do |t|
      t.change_default(:is_read, false)
    end
  end
end
