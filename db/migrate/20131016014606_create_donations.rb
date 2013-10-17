class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.references :initiative, index: true
      t.references :paymentaccount, index: true
      t.integer :amount

      t.timestamps
    end
  end
end
