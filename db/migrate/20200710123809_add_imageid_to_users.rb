class AddImageidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :imageid, :string
  end
end
