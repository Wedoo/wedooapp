class AddElectoralDivisionsToRepresentatives < ActiveRecord::Migration
  def change
    add_column :representatives, :electoral_division, :integer
    add_index :representatives, :electoral_division
  end
end
