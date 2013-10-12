class CreateInitiativeStats < ActiveRecord::Migration
  def change
    create_table :initiative_stats do |t|
      t.integer :signs_count
      t.integer :donations_count
      t.integer :donations_amount
      t.integer :conversions_count
      t.references :initiative, index: true, null: false

      t.timestamps
    end
  end
end
