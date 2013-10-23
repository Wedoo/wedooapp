class SignsController < ApplicationController
  
  filter_access_to [:index, :donwload], require: :manage
  
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
  
  def index
    respond_to do |format|
      format.html { @signs = Sign.of_initiative(@initiative).order(created_at: :desc).page(params[:page]) }
      format.csv { render_csv }
    end
    
  end
    
  private
  
  def sign_params
    params.require(:sign).permit(:first_name, :last_name, :email, :identifier)
  end
  
  def load_initiative
    @initiative = Initiative.find(params[:initiative_id])
  end
  
  def render_csv
    set_file_headers
    set_streaming_headers
    response.status = 200
    #setting the body to an enumerator, rails will iterate this enumerator
    self.response_body = csv_lines
  end

  def set_file_headers
    file_name = "signs_initiative_#{@initiative.id}.csv"
    headers["Content-Type"] = "text/csv"
    headers["Content-disposition"] = "attachment; filename=\"#{file_name}\""
  end


  def set_streaming_headers
    #nginx doc: Setting this to "no" will allow unbuffered responses suitable for Comet and HTTP streaming applications
    headers['X-Accel-Buffering'] = 'no'

    headers["Cache-Control"] ||= "no-cache"
    headers.delete("Content-Length")
  end

  def csv_lines
    Enumerator.new do |y|
      y << Sign.csv_header.to_s
      #ideally you'd validate the params, skipping here for brevity
      Sign.of_initiative(@initiative).find_each { |sign| y << sign.to_csv_row.to_s }
    end
  end

end
