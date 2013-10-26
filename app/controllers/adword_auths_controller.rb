class AdwordAuthsController < ApplicationController
  before_action :set_adword_auth, only: [:show, :edit, :update, :destroy]
  before_action :set_initiative, only: [:show, :edit, :update, :destroy, :select_accounts]
  # GET /adword_auths
  # GET /adword_auths.json
  def index
    @adword_auths = AdwordAuth.all
  end

  # GET /adword_auths/1
  # GET /adword_auths/1.json
  def show
  end

  # GET /adword_auths/new
  def new
    @adword_auth = AdwordAuth.new
  end

  # GET /adword_auths/1/edit
  def edit
  end

  # POST /adword_auths
  # POST /adword_auths.json
  def create
    @adword_auth = AdwordAuth.new(adword_auth_params)

    respond_to do |format|
      if @adword_auth.save
        format.html { redirect_to @adword_auth, notice: 'Adword auth was successfully created.' }
        format.json { render action: 'show', status: :created, location: @adword_auth }
      else
        format.html { render action: 'new' }
        format.json { render json: @adword_auth.errors, status: :unprocessable_entity }
      end
    end
  end
  # POST /adword_auths
  # POST /adword_auths.json
  def create_token
    ong=Ong.find(params[:ong_id])
    initiative=Initiative.find(params[:initiative_id])
    @api = AdwordAuth.create_adwords_api(ong)

    token_params=@api.authorize({
            :oauth2_callback => create_token_ong_adword_auths_url(ong)+ "?initiative_id=#{initiative.id}" ,
            :oauth2_verification_code => params[:code]
    })
    token_params.delete(:id_token)
    @adword_auth = AdwordAuth.new(token_params)
    @adword_auth.ong=ong
    respond_to do |format|
      if @adword_auth.save
        format.html { 
          flash[:auth_adwords] = true
          redirect_to [ong, initiative], notice: 'Autorización Correcta' 
        }
        
      else
        format.html { 
          flash[:auth_adwords] = false
          redirect_to [ong, initiative], notice: 'Autorización Correcta' 
        }
        
      end
    end
  end

  # PATCH/PUT /adword_auths/1
  # PATCH/PUT /adword_auths/1.json
  def update
    respond_to do |format|
      if @adword_auth.update(adword_auth_params)
        format.html { redirect_to @adword_auth, notice: 'Adword auth was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @adword_auth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adword_auths/1
  # DELETE /adword_auths/1.json
  def destroy
    @adword_auth.destroy
    respond_to do |format|
      format.html { redirect_to adword_auths_url }
      format.json { head :no_content }
    end
  end


  def select_accounts
    if request.get?
      graph = get_accounts_graph()
      @accounts = Account.get_accounts_map(graph)
      @all_accounts=Array.new
      @accounts.each_pair do |id, account| 
        @all_accounts << account
        unless account.child_accounts.empty?
          sorted_accounts = account.child_accounts.sort {|a, b| a.customer_id <=> b.customer_id}
          sorted_accounts.each do |account|
            @all_accounts << account
          end
        end
      end
    else
      respond_to do |format|
        if params.has_key? :account_items
          
          @account_id=params[:account_items][:account]
         
          format.js

        else
          @accounts_errors=true
          format.js

        end
        
      end
      

    end
    
  end
  
  def get_accounts_graph
    adwords = AdwordAuth.create_adwords_api(ong)
    service = adwords.service(:ManagedCustomerService, AdwordAuth.get_api_version())
    selector = {:fields => ['Login', 'CustomerId', 'CompanyName']}
    result = nil
    begin
      result = adwords.use_mcc {service.get(selector)}
    rescue AdwordsApi::Errors::ApiException => e
      logger.fatal("Exception occurred: %s\n%s" % [e.to_s, e.message])
      flash.now[:alert] =
          'API request failed with an error, see logs for details'
    end
    return result
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adword_auth
      @adword_auth = AdwordAuth.find(params[:id])
    end

    def set_initiative
      @initiative = Initiative.find(params[:initiative_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adword_auth_params
      params.require(:adword_auth).permit(:initiative_id, :access_token, :refresh_token, :issued_at, :expires_in)
    end
end
