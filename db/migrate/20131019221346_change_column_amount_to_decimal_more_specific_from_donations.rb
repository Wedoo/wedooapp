class ChangeColumnAmountToDecimalMoreSpecificFromDonations < ActiveRecord::Migration
  def change
  	change_column :donations, :amount, :decimal, :precision => 6, :scale => 2, default: 0
  end
end
