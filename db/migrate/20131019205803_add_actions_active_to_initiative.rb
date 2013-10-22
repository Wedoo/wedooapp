class AddActionsActiveToInitiative < ActiveRecord::Migration
  def change
    add_column :initiatives, :protest_active, :boolean
    add_column :initiatives, :spam_active, :boolean
  end
end
