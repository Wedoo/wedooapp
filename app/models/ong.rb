class Ong < ActiveRecord::Base
	has_many :payment_apps


  def get_paypal 
		PaymentApp.where(as_payment_app_type: "PaypalApp", ong_id: self.id).take.specific
	end
end
