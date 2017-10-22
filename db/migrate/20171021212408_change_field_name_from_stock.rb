class ChangeFieldNameFromStock < ActiveRecord::Migration[5.1]
  def change
    change_column :stocks, :created_at, :datetime, :null => true
    change_column :stocks, :updated_at, :datetime, :null => true
  end
end
