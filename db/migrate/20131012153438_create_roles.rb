class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, :null => true
      t.string :symbol, :null => true

      t.timestamps
    end
    add_index :roles, :symbol, unique: true
  end
end
