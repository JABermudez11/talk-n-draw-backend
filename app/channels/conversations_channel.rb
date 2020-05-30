class ConversationsChannel < ApplicationCable::Channel
  # subs means they want the information on that channel to view it
  def subscribed
    # byebug
    @conversation = Conversation.find(params[:id])
    stream_from @conversation    
  end

  # def received(data)
  #   ConversationsChannel.broadcast_to(@conversation, 
  #     {conversation: @conversation, 
  #     users: @conversation.users, 
  #     messages: @conversation.messages})
  # end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
