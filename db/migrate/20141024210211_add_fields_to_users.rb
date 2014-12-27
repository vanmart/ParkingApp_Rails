class AddFieldsToUsers < ActiveRecord::Migration
  def change
    
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :document, :integer
    add_column :users, :phone, :string
    add_column :users, :role, :string
  end
end
