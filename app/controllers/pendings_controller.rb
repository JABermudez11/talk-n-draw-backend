class PendingsController < ApplicationController
  before_action :set_pending, only: [:show, :update, :destroy]

  # GET /pendings
  def index
    @pendings = Pending.all

    render json: @pendings
  end

  # GET /pendings/1
  def show
    render json: @pending
  end

  # POST /pendings
  def create
    @pending = Pending.new(pending_params)

    if @pending.save
      render json: @pending, status: :created, location: @pending
    else
      render json: @pending.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pendings/1
  def update
    if @pending.update(pending_params)
      render json: @pending
    else
      render json: @pending.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pendings/1
  def destroy
    @pending.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pending
      @pending = Pending.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pending_params
      params.require(:pending).permit(:owner_id, :friend_id)
    end
end
