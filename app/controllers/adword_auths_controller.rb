class AdwordAuthsController < ApplicationController
  before_action :set_adword_auth, only: [:show, :edit, :update, :destroy]

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adword_auth
      @adword_auth = AdwordAuth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adword_auth_params
      params.require(:adword_auth).permit(:initiative_id, :access_token, :refresh_token, :issued_at, :expires_in)
    end
end
