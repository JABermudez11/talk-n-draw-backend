class UserConversationsController < ApplicationController
  before_action :set_user_conversation, only: [:show, :update, :destroy]

  # GET /user_conversations
  def index
    @user_conversations = UserConversation.all

    render json: @user_conversations
  end

  # GET /user_conversations/1
  def show
    render json: @user_conversation
  end

  # POST /user_conversations
  def create
    @user_conversation = UserConversation.new(user_conversation_params)

    if @user_conversation.save
      render json: @user_conversation, status: :created, location: @user_conversation
    else
      render json: @user_conversation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_conversations/1
  def update
    if @user_conversation.update(user_conversation_params)
      render json: @user_conversation
    else
      render json: @user_conversation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_conversations/1
  def destroy
    @user_conversation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_conversation
      @user_conversation = UserConversation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_conversation_params
      params.require(:user_conversation).permit(:user_id, :conversation_id)
    end
end
