class InitiativesController < ApplicationController
  
  before_action :load_ong
  
  def new
    @initiative = Initiative.new
  end

  def create
    @initiative = Initiative.new(initiative_params)
    @initiative.ong = @ong
    if @initiative.save
      flash.notice = "Iniciativa creada exitosamente"
      redirect_to ong_initiative_path(@ong, @initiative)
    end
  end

  def show
    @initiative = Initiative.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end
  
  
  private
  def initiative_params
    params.require(:initiative).permit(:title, :description, :hashtag)
  end
  
  def load_ong
    @ong = Ong.find(params[:ong_id])
  end
end
