class CreateRepresentatives < ActiveRecord::Migration
  def change
    create_table :representatives do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :second_last_name, null: false
      t.references :chamber, null: false
      t.string :party, null: false
      t.string :email, null: false
      t.string :twitter
      t.string :facebook
      t.string :webpage

      t.timestamps
    end
    
    add_index :representatives, :first_name
    add_index :representatives, :last_name
    add_index :representatives, :second_last_name
  end
end
