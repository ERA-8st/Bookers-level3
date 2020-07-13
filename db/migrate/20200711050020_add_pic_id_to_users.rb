class AddPicIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pic_id, :string
  end
end
