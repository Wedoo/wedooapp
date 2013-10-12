class AddImageToInitiative < ActiveRecord::Migration
  def change
    add_column :initiatives, :image, :string
  end
end
