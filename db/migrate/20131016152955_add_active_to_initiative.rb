class AddActiveToInitiative < ActiveRecord::Migration
  def change
    add_column :initiatives, :active, :boolean, default: true
    add_index :initiatives, :active
  end
end
