class CreateCommissionsRepresentatives < ActiveRecord::Migration
  def change
    create_table :commissions_representatives, id: false do |t|
      t.references :commission, index: true, null: false
      t.references :representative, index: true, null: false
    end
    
    add_index :commissions_representatives, [:commission_id, :representative_id], unique: true, name: :index_commissions_representatives
  end
end
