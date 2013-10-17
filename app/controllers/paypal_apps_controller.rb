class PaypalAppsController < ApplicationController
  before_action :set_paypal_app, only: [:show, :edit, :update, :destroy]

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
    ap paypal_app_params


    @paypal_app = PaypalApp.new(paypal_app_params)
    @paypal_app.ong=ong
    respond_to do |format|
      if @paypal_app.save
        format.html { redirect_to @paypal_app, notice: 'Paypal app was successfully created.' }
        format.json { render action: 'show', status: :created, location: @paypal_app }
      else
        format.html { render action: 'new' }
        format.json { render json: @paypal_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /paypal_apps/1
  # PATCH/PUT /paypal_apps/1.json
  def update
    respond_to do |format|
      if @paypal_app.update(paypal_app_params)
        format.html { redirect_to @paypal_app, notice: 'Paypal app was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @paypal_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paypal_apps/1
  # DELETE /paypal_apps/1.json
  def destroy
    @paypal_app.destroy
    respond_to do |format|
      format.html { redirect_to paypal_apps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paypal_app
      @paypal_app = PaypalApp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paypal_app_params
      params.require(:paypal_app).permit(:client_id, :client_secret, :username, :app_id, :password, :signature)
    end
end
