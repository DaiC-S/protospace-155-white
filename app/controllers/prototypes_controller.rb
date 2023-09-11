class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC")
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def prototype_params
    params.require(:prototype).permit(:prototype_name, :catchphrase, :concept, :image).merge(user_id: current_user.id)
  end

end
