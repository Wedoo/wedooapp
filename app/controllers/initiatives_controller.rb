class InitiativesController < ApplicationController
  
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
    @initiatives = Initiative.ong_by_actions(ong).only_active
    @past_initiatives = Initiative.where(ong: ong, active: false).limit(10)
  end
  
  
  private
  def initiative_params
    params.require(:initiative).permit(:title, :description, :hashtag)
  end
  
end
