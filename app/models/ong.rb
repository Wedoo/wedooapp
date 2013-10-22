class Ong < ActiveRecord::Base
	has_many :payment_apps, dependent: :destroy
	has_one :paypal_app, dependent: :destroy
  has_many :initiatives, dependent: :destroy
end
