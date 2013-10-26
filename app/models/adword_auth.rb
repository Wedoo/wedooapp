require 'adwords_api'
class AdwordAuth < ActiveRecord::Base
	belongs_to :ong


 	def self.get_api_version()
    return :v201302
  end

  def self.create_adwords_api(ong)
  	config_filename = File.join(Rails.root, 'config', 'adwords_api.yml')
  	@api = AdwordsApi::Api.new(config_filename)
  	token = ong.adword_auth
  	#token = session[:token]
  	
    if token
      credentials = @api.credential_handler()
      credentials.set_credential(:oauth2_token, token.attributes)
      #credentials.set_credential(:client_customer_id, selected_account)
    end
    return @api  	
  end
end
