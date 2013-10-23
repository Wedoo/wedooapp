class ChangeModeFromPaypalApp < ActiveRecord::Migration
  def change
  	change_column :paypal_apps, :mode, :integer, default: 0
  end
end
