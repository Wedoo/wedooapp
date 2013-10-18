class PaypalApp < ActiveRecord::Base
	acts_as :payment_app rescue nil

	validates :app_id, presence: true
	validates :username, presence: true
	validates :password, presence: true
	validates :signature, presence: true

	validates :client_id, presence: true
	validates :client_secret, presence: true


end
