class CreateShares < ActiveRecord::Migration[5.1]
  def change
    create_table :shares do |t|
      t.string :ticker   
      t.timestamps
    end
  end
end
