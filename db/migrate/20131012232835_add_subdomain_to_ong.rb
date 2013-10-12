class AddSubdomainToOng < ActiveRecord::Migration
  def change
    add_column :ongs, :subdomain, :string
  end
end
