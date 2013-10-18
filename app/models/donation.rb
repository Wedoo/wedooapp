class Donation < ActiveRecord::Base
  belongs_to :initiative
  belongs_to :paymentaccount

  def self.create_donate_button(amount, return_url, notify_url)
		@api = PayPal::SDK::ButtonManager::API.new
		@request=@bm_create_button = @api.build_bm_create_button({
		  :ButtonType => "DONATE",
		  :ButtonCode => "ENCRYPTED",
		  :ButtonVar => [
		  	"item_name=Donar",
		  	"amount=" + amount.to_s,
		  	"return="+return_url,
		  	"notify_url="+ notify_url,
		  	"shopping_url=",
		  	"min_amount=",
		  	"subtotal=",
		  	"t3=",
		  	"p3=",
		  	"a3="
		  ] })

		@api.bm_create_button(@request)

  end




end
