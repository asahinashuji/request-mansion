class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :tel
      t.string :budger
      t.string :station
      t.string :walk
      t.string :area
      t.string :year_built
      t.string :elevator
      t.string :floor
      t.string :pet
      t.string :season
      t.string :other
      t.boolean :open
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
