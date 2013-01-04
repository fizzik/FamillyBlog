class CreateAdminSectors < ActiveRecord::Migration
  def change
    create_table :admin_sectors do |t|
      t.string :image
      t.string :status

      t.timestamps
    end
  end
end
