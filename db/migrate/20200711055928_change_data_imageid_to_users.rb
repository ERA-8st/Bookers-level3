class ChangeDataImageidToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :imageid, :text
  end
end
