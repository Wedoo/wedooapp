class AddSignsDonationActiveDefaultToInitiative < ActiveRecord::Migration
  def self.up
    change_column :initiatives, :signs_active, :boolean, default: false
    change_column :initiatives, :donations_active, :boolean, default: false
    Initiative.where(signs_active: nil).update_all(signs_active: false)
    Initiative.where(donations_active: nil).update_all(donations_active: false)
  end
  
  def self.down
    change_column :initiatives, :signs_active, :boolean
    change_column :initiatives, :donations_active, :boolean
  end
end
