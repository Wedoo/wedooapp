class Ong < ActiveRecord::Base
	has_many :payment_apps, dependent: :destroy
	has_one :paypal_app, dependent: :destroy
  has_many :initiatives, dependent: :destroy
  has_one :adword_auth, dependent: :destroy

  def get_paypal 
		PaymentApp.where(as_payment_app_type: "PaypalApp", ong_id: self.id).take.try(:specific)
	end
end
