class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: :create
  # GET /donations
  # GET /donations.json
  def index
    @donations = Donation.all
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
  end

  # GET /donations/new
  def new
    @donation = Donation.new
  end

  # GET /donations/1/edit
  def edit
  end

  def thanks

    redirect_to ong_initiative_path(ong, params[:initiative_id]) + "#gracias"

  end

  def no_thanks

     redirect_to ong_initiative_path(ong, params[:initiative_id]) + "#tryagainplease"
  end

  # POST /donations
  # POST /donations.json
  def create
    amount=params[:payment_gross].to_d - params[:mc_fee].to_d
    if(params[:payment_status]=="Completed")
       @donation = Donation.new(
        :initiative_id => params[:initiative_id].to_i,
        :payment_service_name => "PayPal",
        :amount =>amount
       )
       if @donation.save
          render nothing: true, status: :ok
       else
          render nothing: true, status: :internal_server_error
       end
    end

    # respond_to do |format|
    #   if @donation.save
    #     format.html { redirect_to @donation, notice: 'Donation was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @donation }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @donation.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /donations/1
  # PATCH/PUT /donations/1.json
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params.require(:donation).permit(:initiative_id, :payment_service_name, :amount)
    end
end
