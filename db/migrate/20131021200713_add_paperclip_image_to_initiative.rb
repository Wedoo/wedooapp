class AddPaperclipImageToInitiative < ActiveRecord::Migration
  def self.up
    remove_column :initiatives, :image
    add_attachment :initiatives, :image
  end
  
  def self.down
    add_column :initiatives, :image
    remove_attachment :initiatives, :image
  end
end
