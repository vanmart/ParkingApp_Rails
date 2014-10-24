class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string
    add_column :users, :document_id, :integer
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :cellphone, :integer
  end
end
