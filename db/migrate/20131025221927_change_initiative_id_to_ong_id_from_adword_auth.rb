class ChangeInitiativeIdToOngIdFromAdwordAuth < ActiveRecord::Migration
  def change
  	remove_column :adword_auths, :initiative_id
  	add_reference :adword_auths, :ong, index: true
  end
end
