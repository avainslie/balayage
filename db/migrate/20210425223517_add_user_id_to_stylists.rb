class AddUserIdTostylists < ActiveRecord::Migration[6.1]
  def change
    add_column :stylists, :user_id, :integer
    add_index :stylists, :user_id
  end
end
