class ChangePaymentaccountIdFromDonations < ActiveRecord::Migration
  def change
  	change_column :donations, :paymentaccount_id, :string, default: "PayPal"
  	rename_column :donations, :paymentaccount_id, :payment_service_name
  end
end
