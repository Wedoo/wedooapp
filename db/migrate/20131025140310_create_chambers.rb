class CreateChambers < ActiveRecord::Migration
  def change
    create_table :chambers do |t|
      t.string :name, null: false

      t.timestamps
    end
    
    add_index :chambers, :name, unique: true
  end
end
