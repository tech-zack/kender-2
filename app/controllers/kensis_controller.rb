class KensisController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  before_action :move_to_index, except: [:index,:new,:create]

  def index
    @kensis = Kensi.order(created_at: :desc).page(params[:page]).per(4)
  end

  def new
    @kensi = Kensi.new
  end
  
  def create
    Kensi.create(kensi_params)
  end

  private
  def kensi_params
    params.require(:kensi).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user != @scholar.user
    redirect_to action: :index
    end
  end

end
