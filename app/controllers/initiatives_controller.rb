class InitiativesController < ApplicationController
  
  filter_access_to [:new, :create, :edit, :update, :destroy], require: :manage
  
  before_action :set_initiative, only: [:show, :edit, :update, :destroy, :toggle_signs_active, :toggle_spam_active]
  
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
    else
      render :new, alert: "Error al crear la iniciativa. Por favor, inténtalo de nuevo."
    end
  end

  def show
    @initiatives = Initiative.ong_by_actions(ong).only_active.limit(10)
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
    @initiative.destroy
    respond_to do |format|
      format.html { redirect_to ong_initiatives_path(ong) }
      format.json { head :no_content }
    end
  end

  def index
    @initiatives = Initiative.ong_by_actions(ong).only_active
    @past_initiatives = Initiative.where(ong: ong, active: false).limit(10)
  end
  
  def toggle_signs_active
    @initiative.signs_active = !@initiative.signs_active
    @initiative.save
    redirect_to [ong, @initiative]
  end
  
  def toggle_spam_active
    if request.get?
      @initiative.spam_active = false
    else
      @initiative.update(params.require(:initiative).permit(:spam_param, :spam_receiver_selected, :spam_active))
    end
    @initiative.save
    redirect_to action: :show
  end
  
  private
  def initiative_params
    params.require(:initiative).permit(:title, :description, :hashtag, :image, :delete_image, :active)
  end
  
  def set_initiative
    @initiative = Initiative.find(params[:id])
  end
  
end
