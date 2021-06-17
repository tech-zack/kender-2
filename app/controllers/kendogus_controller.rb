class KendogusController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  before_action :move_to_index, except: [:index,:new,:create]
  
  def index
    @kendogus = Kendogu.order(created_at: :desc).page(params[:page]).per(4)
  end

  def new
    @kendogu = Kendogu.new
  end

  def create
    Kendogu.create(kendogu_params)
  end

  private
  def kendogu_params
    params.require(:kendogu).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user != @scholar.user
    redirect_to action: :index
    end
  end
end
