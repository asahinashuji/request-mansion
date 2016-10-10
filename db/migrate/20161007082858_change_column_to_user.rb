class ChangeColumnToUser < ActiveRecord::Migration
  def change
    def up
      change_colum :users, :open, :boolean, default: false
    end
    
    def down
      change_colum :users, :open, :boolean, default: true
    end
  end
end
