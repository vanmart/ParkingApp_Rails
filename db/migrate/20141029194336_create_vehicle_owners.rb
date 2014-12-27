class CreateVehicleOwners < ActiveRecord::Migration
  def change
    create_table :vehicle_owners do |t|
      t.string :name
      t.string :last_name
      t.string :document
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
