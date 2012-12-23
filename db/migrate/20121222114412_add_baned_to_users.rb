class AddBanedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :baned, :boolean, :default => true
  end
end
