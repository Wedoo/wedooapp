class ChangeColumnAmountToDecimalFromDonations < ActiveRecord::Migration
  def change
  	change_column :donations, :amount, :decimal, default: 0
  end
end
