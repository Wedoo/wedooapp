class CreateRelatedLinks < ActiveRecord::Migration
  def change
    create_table :related_links do |t|
      t.text :description
      t.string :url, null: false, limit: 2000
      t.references :initiative, index: true, null: false

      t.timestamps
    end
  end
end
