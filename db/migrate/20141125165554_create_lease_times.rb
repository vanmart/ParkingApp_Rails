class CreateLeaseTimes < ActiveRecord::Migration
  def change
    create_table :lease_times do |t|
      t.string :name
      t.string :seconds

      t.timestamps
    end
  end
end
