class AddModeToPaypalApp < ActiveRecord::Migration
  def change
    add_column :paypal_apps, :mode, :boolean, defaul: 0
  end
end
