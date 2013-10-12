class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :type
      t.string :keywords
      t.string :text
      t.references :initiative, index: true

      t.timestamps
    end
    
    add_index :ads, :type
  end
end
