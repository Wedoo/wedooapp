class CreatePaymentApps < ActiveRecord::Migration
  def change
    create_table :payment_apps, :as_relation_superclass => true do |t|
      t.integer :last_account_balance
      t.boolean :active

      t.timestamps
    end
  end
end
