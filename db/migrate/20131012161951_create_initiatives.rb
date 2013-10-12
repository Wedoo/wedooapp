class CreateInitiatives < ActiveRecord::Migration
  def change
    create_table :initiatives do |t|
      t.string :title, null: false, 
      t.text :description, null: false, 
      t.string :hashtag
      t.boolean :signs_active
      t.bolean :donations_active
      t.references :ong, index: true

      t.timestamps
    end

    add_index :initiatives, :title
  end
end
