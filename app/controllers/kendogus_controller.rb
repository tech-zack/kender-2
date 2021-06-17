class KendogusController < ApplicationController
  
  def index
  end

  def new
    @kendogu = Kendogu.new
  end

  def create
    Kendogu.create(kendogu_params)
  end

  private
  def kendogu_params
    params.require(:kendougu).permit(:name, :image, :text, :title)
  end

end
