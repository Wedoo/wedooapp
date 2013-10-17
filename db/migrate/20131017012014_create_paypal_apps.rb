class CreatePaypalApps < ActiveRecord::Migration
  def change
    create_table :paypal_apps do |t|
      t.string :client_id
      t.string :client_secret
      t.string :username
      t.string :app_id
      t.string :password
      t.string :signature

      t.timestamps
    end
  end
end
