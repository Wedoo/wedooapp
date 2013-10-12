class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :identifier, null: false
      t.boolean :validated
      t.references :initiative, index: true

      t.timestamps
    end
    
    add_index :signs, :email
    add_index :signs, :identifier
    add_index :signs, :validated
  end
end
