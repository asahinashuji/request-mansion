class AddWingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :wing, :boolean, default: false
  end
end
