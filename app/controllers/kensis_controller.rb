class KensisController < ApplicationController
  
  def index
  end

  def new
    @kensi = Kensi.new
  end

  def create
    Kendogu.create(kendogu_params)
  end

  private
  def kensi_params
    params.require(:kensi).permit(:name, :image, :text, :title)
  end

end
