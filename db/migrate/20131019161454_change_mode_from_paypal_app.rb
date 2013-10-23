class ChangeModeFromPaypalApp < ActiveRecord::Migration
  def change
    remove_column :paypal_apps, :mode
  	add_column :paypal_apps, :mode, :integer, default: 0
  end
end
