class KenzyutusController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :set_kenzyutu, only:[:edit,:update,:destroy]
  before_action :move_to_index, except: [:index,:new,:create,:show, :search]

  def index
    @kenzyutus = Kenzyutu.order(created_at: :desc).page(params[:page]).per(4)
  end

  def new
    @kenzyutu = Kenzyutu.new
  end

  def create
    @kenzyutu = Kenzyutu.new(kenzyutu_params)
    if @kenzyutu.save
      redirect_to kenzyutus_path
    else
      render :new
    end
  end

  def destroy
    if @kenzyutu.destroy
      redirect_to kenzyutus_path
    end
  end
  
  def edit
  end
  
  def update
    if @kenzyutu.update(kenzyutu_params)
      redirect_to kenzyutus_path
    else
      render :edit
    end
  end
  
  def show
    @p =  Kenzyutu.all
    if @p.ids.include?(params[:id].to_i)
      @kenzyutu = Kenzyutu.find(params[:id])
      @message = Message.new
      @messages = @kenzyutu.messages.includes(:user)
  else
    redirect_to kenzyutus_path
  end
end
  
  def search
    @kenzyutus = Kenzyutu.search(params[:keyword])
  end

  private
  def kenzyutu_params
    params.require(:kenzyutu).permit(:title, :text, :image).merge(user_id: current_user.id)
  end

  def set_kenzyutu
    @kenzyutu = Kenzyutu.find(params[:id])
  end

  def move_to_index
    if current_user != @kenzyutu.user
    redirect_to action: :index
    end
  end
end

