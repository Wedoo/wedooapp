class AddGoogleIdToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :google_id, :integer
  end
end
