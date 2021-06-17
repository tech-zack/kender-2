class KenzyutusController < ApplicationController

  def index
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

end

