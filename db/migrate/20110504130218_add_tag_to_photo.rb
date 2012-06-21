class AddTagToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :tag, :string
  end

  def self.down
    remove_column :photos, :tag
  end
end
