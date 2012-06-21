class CreateCustomerInformations < ActiveRecord::Migration
  def self.up
    create_table :customer_informations do |t|
        t.string :name
        t.decimal :charge, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :customer_informations
  end
end
