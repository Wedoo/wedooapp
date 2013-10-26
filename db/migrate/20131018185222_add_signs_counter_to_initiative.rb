class AddSignsCounterToInitiative < ActiveRecord::Migration
  def change
    add_column :initiatives, :signs_count, :integer, default: 0
    
    Initiative.reset_column_information
    Initiative.all.each do |i|
      Initiative.update_counters i.id, signs_count: i.signs.count
    end
  end
end
