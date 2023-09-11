class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, only: [:edit, :update]

  def index
    @prototypes = Prototype.includes(:user).order('created_at DESC')
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

  def show
  end

  def edit
    redirect_to root_path if user_signed_in? && current_user.id != @prototype.user_id
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to prototype_path(@prototype.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:prototype_name, :catchphrase, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
