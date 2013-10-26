class CreateCommissions < ActiveRecord::Migration
  def change
    create_table :commissions do |t|
      t.string :name, null: false
      t.references :chamber, null: false

      t.timestamps
    end
    
    add_index :commissions, [:name, :chamber_id], unique: true
  end
end
