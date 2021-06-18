class KendogusController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :set_kendogu, only:[:edit,:update,:destroy]
  before_action :move_to_index, except: [:index,:new,:create,:show, :search]
  
  def index
    @kendogus = Kendogu.order(created_at: :desc).page(params[:page]).per(4)
  end

  def new
    @kendogu = Kendogu.new
  end

  def create
    @kendogu = Kensi.new(kendogu_params)
    if @kendogu.save
      redirect_to kendogus_path
    else
      render :new
    end
  end

  def destroy
    if @kendogu.destroy
      redirect_to kendogus_path
    end
  end
  
  def edit
  end
  
  def update
    if @kendogu.update(kendogu_params)
      redirect_to kendogus_path
    else
      render :edit
    end
  end
  
  def show
    @p =  Kendogu.all
    if @p.ids.include?(params[:id].to_i)
      @kendogu = Kendogu.find(params[:id])
      @speak = Speak.new
      @speaks = @kendogu.speaks.includes(:user)
  else
    redirect_to kendogus_path
  end
end

def search
  @kendogus = Kendogu.search(params[:keyword])
end
  
  private
  def kendogu_params
    params.require(:kendogu).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
  
  def set_kendogu
    @kendogu = Kendogu.find(params[:id])
  end

  def move_to_index
    if current_user != @kendogu.user
    redirect_to action: :index
    end
  end
end
