class AddMultiColumnToCustomFields < ActiveRecord::Migration
  def self.up
    add_column :custom_fields, :multi_column, :boolean, :default => false, :null => false
  end
  
  def self.down
    remove_column :custom_fields, :multi_column
  end
end
