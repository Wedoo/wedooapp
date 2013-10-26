class CreateMunicipalities < ActiveRecord::Migration
  def change
    create_table :municipalities do |t|
      t.string :name
      t.integer :district
      t.integer :circunscription
      
      t.timestamps
    end
    add_index :municipalities, :name, unique: true
    add_index :municipalities, :district
    add_index :municipalities, :circunscription
  end
end
