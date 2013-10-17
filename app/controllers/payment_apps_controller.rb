class PaymentAppsController < ApplicationController
  before_action :set_payment_app, only: [:show, :edit, :update, :destroy]

  # GET /payment_apps
  # GET /payment_apps.json
  def index
    @payment_apps = PaymentApp.all
  end

  # GET /payment_apps/1
  # GET /payment_apps/1.json
  def show
  end

  # GET /payment_apps/new
  def new
    @payment_app = PaymentApp.new
  end

  # GET /payment_apps/1/edit
  def edit
  end

  # POST /payment_apps
  # POST /payment_apps.json
  def create
    @payment_app = PaymentApp.new(payment_app_params)

    respond_to do |format|
      if @payment_app.save
        format.html { redirect_to @payment_app, notice: 'Payment app was successfully created.' }
        format.json { render action: 'show', status: :created, location: @payment_app }
      else
        format.html { render action: 'new' }
        format.json { render json: @payment_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_apps/1
  # PATCH/PUT /payment_apps/1.json
  def update
    respond_to do |format|
      if @payment_app.update(payment_app_params)
        format.html { redirect_to @payment_app, notice: 'Payment app was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_apps/1
  # DELETE /payment_apps/1.json
  def destroy
    @payment_app.destroy
    respond_to do |format|
      format.html { redirect_to payment_apps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_app
      @payment_app = PaymentApp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_app_params
      params.require(:payment_app).permit(:pay_service_id, :pay_service_type, :last_account_balance, :active)
    end
end
