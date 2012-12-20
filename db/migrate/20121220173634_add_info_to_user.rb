class AddInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :skype, :string
    add_column :users, :phone, :string
    add_column :users, :date_of_birth, :string
    add_column :users, :town, :string
    add_column :users, :about, :text
  end
end
