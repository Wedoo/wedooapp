class PaypalApp < ActiveRecord::Base
	acts_as :payment_app rescue nil

	validates :app_id, presence: true
	validates :username, presence: true
	validates :password, presence: true
	validates :signature, presence: true

	validates :client_id, presence: true
	validates :client_secret, presence: true



  def create_donate_button(params={})



		@api = PayPal::SDK::ButtonManager::API.new(
		  :mode      => Constants::PAYPAL_MODES[self.mode.to_int],  # Set "live" for production
		  :app_id    => self.app_id,
		  :username  => self.username,
		  :password  => self.password,
		  :signature => self.signature	
		)

		@request=@bm_create_button = @api.build_bm_create_button({
		  :ButtonType => "DONATE",
		  :ButtonCode => "CLEARTEXT",
		  :ButtonVar => [
		  	"item_name=Donar",
		  	"amount=" + params[:amount].to_s,
		  	"return="+params[:return_url],
		  	"notify_url="+ params[:notify_url],
		  	"cancel_return="+params[:cancel_return],
		  	"shopping_url=",
		  	"min_amount=",
		  	"subtotal=",
		  	"t3=",
		  	"p3=",
		  	"a3=", 
		  	"lc=ES"
		  ] })

		@api.bm_create_button(@request)

  end
end
