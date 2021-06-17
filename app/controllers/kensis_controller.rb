class KensisController < ApplicationController
  
  def index
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

end
