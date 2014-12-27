class CreateLeases < ActiveRecord::Migration
  def change
    create_table :leases do |t|
      t.datetime :entry_date
      t.datetime :exit_date
      t.float   :value
      t.integer :lease_type_id
      t.string :vehicle_plate
      t.integer :parking_user_id
      
      t.timestamps
    end
  end
end
