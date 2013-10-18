class SignsController < ApplicationController
  
  before_action :load_initiative
  
  def new
    @sign = Sign.new
  end

  def create
    @sign = Sign.new(sign_params)
    @sign.initiative = @initiative
    respond_to do |format|
      if @sign.save
        @initiative.reload
        format.html do
          flash.notice = t(:thank_you, scope: [:signs], count: @initiative.signs_count)
          redirect_to ong_initiative_path(@initiative)
        end
        format.js do
          @success = true
          @thankyou_message = t(:thank_you, scope: [:signs], count: @initiative.signs_count)
        end
      else
        format.html do
          flash.alert = "Hubo un error en los datos que llenaste. Por favor revísalo y envíalo de nuevo."
          redirect_to ong_initiative_path(ong, @initiative)
        end
        format.js do
          @success = false
        end
      end      
    end

  end
  
  private
  
  def sign_params
    params.require(:sign).permit(:first_name, :last_name, :email, :identifier)
  end
  
  def load_initiative
    @initiative = Initiative.find(params[:initiative_id])
  end
end
