class CreateOngs < ActiveRecord::Migration
  def change
    create_table :ongs do |t|
      t.string :name, null: false
      t.text :mission
      t.text :vission
      t.string :webpage, limit: 2000
      t.string :address
      t.string :twitter
      t.string :facebook

      t.timestamps
    end
    
    add_index :ongs, :name, unique: true
    add_index :ongs, :twitter, unique: true
    add_index :ongs, :facebook, unique: true
  end
end
