require 'adwords_api'
require 'logger'
class AdwordAuth < ActiveRecord::Base
	belongs_to :ong


 	def self.get_api_version()
    return :v201309
  end

  def self.create_adwords_api(ong)
    logger = Logger.new('/Users/danielbarria/adwords_debug')
    logger.level = Logger::DEBUG
  	config_filename = File.join(Rails.root, 'config', 'adwords_api.yml')
  	@api = AdwordsApi::Api.new(config_filename)
    @api.logger = logger
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
