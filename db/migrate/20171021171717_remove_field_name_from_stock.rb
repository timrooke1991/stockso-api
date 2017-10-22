class RemoveFieldNameFromStock < ActiveRecord::Migration[5.1]
  def change
    remove_column :stocks, :name
    remove_column :stocks, :description
    remove_column :stocks, :sector
    remove_column :stocks, :mcap

  end
end
