class AddCountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :count, :integer, :default => 1
  end

  def self.down
    remove_column :users, :count
  end
end
