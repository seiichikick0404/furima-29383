class MessagesController < ApplicationController
  def create
    if message = Message.create(message_params)
      redirect_to "/items/#{message.item.id}"
    else 
      render 'items/show'
    end
  end

  def destroy
    @message = Message.find(params[:id])
    if @message.destroy
      redirect_to "/items/#{@message.item.id}"
    else
      render 'items/show'
    end
  end

  private
  def message_params
    params.require(:message).permit(:comments).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
