class PaypalAppsController < ApplicationController
  before_action :set_paypal_app, only: [:show, :edit, :update, :destroy]
  
  before_action :set_initiative, only: [:show, :edit, :update, :destroy]
  
  # GET /paypal_apps
  # GET /paypal_apps.json
  def index
    @paypal_apps = PaypalApp.all
  end

  # GET /paypal_apps/1
  # GET /paypal_apps/1.json
  def show
  end

  # GET /paypal_apps/new
  def new
    @paypal_app = PaypalApp.new
  end

  # GET /paypal_apps/1/edit
  def edit
    

  end

  # POST /paypal_apps
  # POST /paypal_apps.json
  def create
    @paypal_app = PaypalApp.new(paypal_app_params)
    
    @paypal_app.ong=ong
    @paypal_app.mode=0
    @paypal_app.client_id="test"
    @paypal_app.client_secret="test"
    @paypal_app.app_id="APP-80W284485P519543T"
    respond_to do |format|
      if @paypal_app.save
        format.html { redirect_to [ong, @paypal_app], notice: 'Paypal app was successfully created.' }
        format.json { render action: 'show', status: :created, location: @paypal_app }
        format.js
      else
        #format.html { request.xhr? ? render(:partial => 'form') : render(:action => 'new') }
        format.html { render action: 'new' }
        format.json { render json: @paypal_app.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /paypal_apps/1
  # PATCH/PUT /paypal_apps/1.json
  def update
    respond_to do |format|
      if @paypal_app.update(paypal_app_params)
          format.js
      else
        format.html { render action: 'edit' }
        format.json { render json: [@paypal_app.errors], status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /paypal_apps/1
  # DELETE /paypal_apps/1.json
  def destroy
    @paypal_app.destroy
    respond_to do |format|
      format.html { redirect_to ong_paypal_apps_url(ong) }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paypal_app
      @paypal_app = PaypalApp.find(params[:id])
    end
    def set_initiative
      @initiative = Initiative.find(params[:initiative_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paypal_app_params
      params.require(:paypal_app).permit(:active,:mode,:client_id, :client_secret, :username, :app_id, :password, :signature)
    end
end
