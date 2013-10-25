class AddSpamToToInitiatives < ActiveRecord::Migration
  def change
    add_column :initiatives, :spam_receiver_id, :integer
    add_column :initiatives, :spam_receiver_type, :string
  end
end
