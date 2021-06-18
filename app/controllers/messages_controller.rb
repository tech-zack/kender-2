class MessagesController < ApplicationController
  def create
    message = Message.create(message_params)
    redirect_to "/kenzyutus/#{message.kenzyutu.id}"
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, kenzyutu_id: params[:kenzyutu_id])
  end
end
