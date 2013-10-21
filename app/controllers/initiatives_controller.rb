class InitiativesController < ApplicationController
  
  before_action :set_initiative, only: [:show, :edit, :update]
  
  def new
    @initiative = Initiative.new
  end

  def create
    @initiative = Initiative.new(initiative_params)
    @initiative.ong = ong
    @initiative.initiative_stat = InitiativeStat.new
    if @initiative.save
      flash.notice = "Iniciativa creada exitosamente"
      redirect_to ong_initiative_path(ong, @initiative)
    end
  end

  def show
    @initiatives = Initiative.ong_by_actions(ong)
  end

  def edit
  end

  def update
    if @initiative.update(initiative_params)
      redirect_to ong_initiative_path(ong, @initiative), notice: "Iniciativa guardada exitosamente."
    else
      render action: 'edit'
    end
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
  
  def set_initiative
    @initiative = Initiative.find(params[:id])
  end
  
end
