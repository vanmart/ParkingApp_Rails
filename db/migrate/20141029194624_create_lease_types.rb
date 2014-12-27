class CreateLeaseTypes < ActiveRecord::Migration
  def change
    create_table :lease_types do |t|
      t.string :name
      t.float :price
      t.integer :vehicle_type_id
      t.integer :parking_id
      t.integer :lease_time_id
      t.timestamps
    end
  end
end
