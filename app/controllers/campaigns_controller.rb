class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]
  before_action :set_initiative, only: [:show, :edit, :update, :destroy, :new, :create]
  PAGE_SIZE = 50
  # GET /campaigns
  # GET /campaigns.json
  def index
    @campaigns = Campaign.all
  end

  # GET /campaigns/1
  # GET /campaigns/1.json
  def show
  end


  # GET /campaigns/new
  def new
    @campaign = Campaign.new
    campaing_list
  end

  def request_campaigns_list(ong)
    api = AdwordAuth.create_adwords_api(ong)
    service = api.service(:CampaignService, AdwordAuth.get_api_version())
    selector = {
      :fields => ['Id', 'Name', 'Status'],
      :ordering => [{:field => 'Id', :sort_order => 'ASCENDING'}],
      :paging => {:start_index => 0, :number_results => PAGE_SIZE}
    }
    result = nil
    begin
      result = service.get(selector)
    rescue AdwordsApi::Errors::ApiException => e
      logger.fatal("Exception occurred: %s\n%s" % [e.to_s, e.message])
      flash.now[:alert] =
          'API request failed with an error, see logs for details'
    end
    return result
  end

  # GET /campaigns/1/edit
  def edit
  end

  # POST /campaigns
  # POST /campaigns.json
  def create
    
    if params[:campaign_items] and params[:campaign_items][:campaign]
      
      campaign_params=Hash.new
      campaign_params[:id]=params[:campaign_items][:campaign]

      @campaign = Campaign.new(campaign_params)
      @campaign.get_campaign_atts(ong)
      @initiative.donations_active=true
      respond_to do |format|
        if @campaign.save and  @initiative.save
          format.json { render action: 'show', status: :created, location: @campaign }
          format.js
          else
          format.html { render action: 'new' }
          format.json { render json: @campaign.errors, status: :unprocessable_entity }
          format.js
        end
      end
    else
      @campaigns_list_error=true
      respond_to do |format|
        format.js   
      end
    end
  end

  # PATCH/PUT /campaigns/1
  # PATCH/PUT /campaigns/1.json
  def update
    respond_to do |format|
      if @campaign.update(campaign_params)
        format.html { redirect_to @campaign, notice: 'Campaign was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaigns/1
  # DELETE /campaigns/1.json
  def destroy
    @campaign.destroy
    respond_to do |format|
      format.html { redirect_to campaigns_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def campaing_list
      @account_id=params[:account_id]
      if params[:account_id]
        @account_id=params[:account_id]
        response = request_campaigns_list(ong)
        if response
          @campaigns = Campaign.get_campaigns_list(response)
          @campaign_count = response[:total_num_entries]
        end
      end    

    end 
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def set_initiative
      @initiative = Initiative.find(params[:initiative_id])
    end    

    # Never trust parameters from the scary internet, only allow the white list through.
    def campaign_params
      params.permit(:initiative_id, :name, :status, :campaign_items, :campaign, :account_id)
    end
end
