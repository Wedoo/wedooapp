class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.references :initiative, index: true
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
