class CreatePravins < ActiveRecord::Migration
  def self.up
    create_table :pravins do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :pravins
  end
end
