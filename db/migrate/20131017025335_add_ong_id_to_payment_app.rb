class AddOngIdToPaymentApp < ActiveRecord::Migration
  def change
    add_reference :payment_apps, :ong, index: true
  end
end
