class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :fio
      t.text :letter
      t.string :phone
      t.string :town
      t.string :email

      t.timestamps
    end
  end
end
