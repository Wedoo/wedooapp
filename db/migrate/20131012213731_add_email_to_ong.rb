class AddEmailToOng < ActiveRecord::Migration
  def change
    add_column :ongs, :email, :string
  end
end
