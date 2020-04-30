class ConversationsChannel < ApplicationCable::Channel
  # subs means they want the information on that channel to view it
  def subscribed
    # byebug
    @conversation = Conversation.find_by(id: params[:conversation])
    stream_from @conversation    
  end

  def received(data)
    ConversationsChannel.broadcast_to(@conversation, 
      {conversation: @conversation, 
      users: @conversation.users, 
      messages: @conversation.messages})
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def message_params
    params.require(:message).permit(:user_id, :chat_id, :content)
  end
end
