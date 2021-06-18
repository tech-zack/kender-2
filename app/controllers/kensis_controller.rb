class KensisController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :set_kensi, only:[:edit,:update,:destroy]
  before_action :move_to_index, except: [:index, :show,:new,:create]

  def index
    @kensis = Kensi.order(created_at: :desc).page(params[:page]).per(4)
  end

  def new
    @kensi = Kensi.new
  end
  
  def create
    @kensi = Kensi.new(kensi_params)
    if @kensi.save
      redirect_to kensis_path
    else
      render :new
    end
  end

  def destroy
    if @kensi.destroy
      redirect_to kensis_path
    end
  end
  
  def edit
  end
  
  def update
    if @kensi.update(kensi_params)
      redirect_to kensis_path
    else
      render :edit
    end
  end
  
  def show
    @p =  Kensi.all
    if @p.ids.include?(params[:id].to_i)
      @kensi = Kensi.find(params[:id])
    @comment = Comment.new
    @comments = @kensi.comments.includes(:user)
  else
    redirect_to kensis_path
  end
end
  

  private
  def kensi_params
    params.require(:kensi).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def set_kensi
    @kensi = Kensi.find(params[:id])
  end

  def move_to_index
    if current_user != @kensi.user
    redirect_to action: :index
    end
  end
end
