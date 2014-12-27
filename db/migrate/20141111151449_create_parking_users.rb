class CreateParkingUsers < ActiveRecord::Migration
  def change
    create_table :parking_users do |t|
      t.integer :user_id
      t.integer :parking_id
      t.timestamps
    end
  end
end
