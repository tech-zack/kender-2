class KenzyutusController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  before_action :move_to_index, except: [:index,:new,:create]

  def index
    @kenzyutus = Kenzyutu.order(created_at: :desc).page(params[:page]).per(4)
  end

  def new
    @kenzyutu = Kenzyutu.new
  end

  def create
    Kenzyutu.create(kenzyutu_params)
  end

  private
  def kenzyutu_params
    params.require(:kenzyutu).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user != @scholar.user
    redirect_to action: :index
    end
  end
end

