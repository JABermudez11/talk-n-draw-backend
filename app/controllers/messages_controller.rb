class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :update, :destroy]

  # GET /messages
  def index
    @messages = Message.all

    render json: @messages
  end

  # GET /messages/1
  def show
    render json: @message
  end

  # POST /messages
  def create
    @message = Message.new(message_params)
    # conversation = Conversation.find(message_params["conversation_id"])
    if @message.save
      conversation = Conversation.find(@message.conversation_id)
      ConversationsChannel.broadcast_to(conversation, @message)
      # ConversationsChannel.broadcast_to(conversation, {
      #   conversation: ConversationSerializer.new(conversation),
      #   users: UserSerializer.new(conversation.users),
      #   messages: MessageSerializer.new(conversation.messages)
      # })
    end
    # render json: MessageSerializer.new(message)
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def message_params
      params.require(:message).permit(:content, :user_id, :conversation_id)
    end
  
end
