class Campaign < ActiveRecord::Base
  belongs_to :initiative
  attr_accessor:campaign_stats
  attr_accessor :frequency_cap

	def self.get_campaigns_list(response)
		result = Array.new
		if response[:entries]
		  response[:entries].each do |api_campaign|
		    campaign = Campaign.new(api_campaign)
		    result << campaign
		  end
		end
		return result
	end

  def get_campaign_label
    self.name
  end

  def get_campaign_value
    self.id
  end

  def get_campaign_atts(ong)

  	api = AdwordAuth.create_adwords_api(ong)
  	service = api.service(:CampaignService, AdwordAuth.get_api_version())
  	selector = {
      :fields => ['Id', 'Name', 'Status'],
      :predicates => [{:field=>'Id', :operator=>'EQUALS', :values=>["#{self.id}"]}]

    }
    result = nil
    begin
    	
      result = service.get(selector)
      self.name=result[:entries].first[:name]
      self.status=Constants::PAYPAL_MODES.index(result[:entries].first[:status])

    rescue AdwordsApi::Errors::ApiException => e
      logger.fatal("Exception occurred: %s\n%s" % [e.to_s, e.message])
      flash.now[:alert] =
          'API request failed with an error, see logs for details'
    end

    
        
	end

end
