class CreateStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :stocks do |t|
      t.string :ticker
      t.string :name
      t.text :description
      t.string :sector
      t.float :mcap

      t.timestamps
    end
  end
end
