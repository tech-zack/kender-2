class SpeaksController < ApplicationController
  def create
    speak = Speak.create(speak_params)
    redirect_to "/kendogus/#{speak.kendogu.id}"
  end

  private
  def speak_params
    params.require(:speak).permit(:text).merge(user_id: current_user.id, kendogu_id: params[:kendogu_id])
  end
end
