class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :user_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
