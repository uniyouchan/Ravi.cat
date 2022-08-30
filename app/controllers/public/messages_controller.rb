class Public::MessagesController < ApplicationController
  before_action :authenticate_customer!

  def create
    @message = Message.new(message_params)
    @message.customer_id = current_customer.id
    if @message.save
      flash[:alert] = "メッセージを送信しました。"
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
    redirect_to "/rooms/#{@message.room_id}"
  end

  private

  def message_params
    params.require(:message).permit(:room_id, :body)
  end
end
