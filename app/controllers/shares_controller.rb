class SharesController < ApplicationController
  before_action :set_share, only: [:show, :update, :destroy]

  # GET /shares
  def index
    @shares = Share.all

    render json: @shares
  end

  # GET /shares/LSE
  def show
    render json: @share
  end

  # POST /shares
  def create
    @share = Share.new(share_params)

    if @share.save
      render json: @share, status: :created, location: @share
    else
      render json: @share.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shares/LSE
  def update
    if @share.update(share_params)
      render json: @share
    else
      render json: @share.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shares/LSE
  def destroy
    @share.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share
      @share = Share.find_by(ticker: params[:ticker])
    end

    # Only allow a trusted parameter "white list" through.
    def share_params
      params.require(:share).permit(:ticker, :name, :description, :sector, :mcap)
    end

end
