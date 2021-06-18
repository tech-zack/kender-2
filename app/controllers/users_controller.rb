class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :move_to_index, except: [:show]

  def show
    @user = User.find(params[:id])
    @kensis = current_user.kensis.order(created_at: :desc).page(params[:page]).per(3)
    @kenzyutus = current_user.kenzyutus.order(created_at: :desc).page(params[:page]).per(3)
    @kendogus = current_user.kendogus.order(created_at: :desc).page(params[:page]).per(3)
  end

  private

  def move_to_index
    if current_user != @kensi.user
       redirect_to action: :index
    end
    if current_user != @kenzyutu.user
       redirect_to action: :index
    end
    if current_user != @kendogu.user
       redirect_to action: :index
    end
  end
end
