class Ong < ActiveRecord::Base
	has_many :payment_apps
	has_one :paypal_app
end
