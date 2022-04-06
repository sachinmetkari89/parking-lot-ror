class ParkingLotsController < ApplicationController
  before_action :set_parking_lot, only: %i[show edit update destroy]

  # GET /parking_lots
  def index
    @parking_lots = ParkingLot.all
    render json: @parking_lots, each_serializer: ParkingLotSerializer, status: :ok
  end

  # GET /parking_lots/1
  def show
    render json: @parking_lot, serializer: ParkingLotSerializer, status: :ok
  end

  # POST /parking_lots
  def create
    parking_lot = ParkingLot.new(parking_lot_params)

    if parking_lot.save
      render json: parking_lot, serializer: ParkingLotSerializer, meta: { notice: t('parking_lots.create.success') }, status: :created
    else
      render json: { errors: parking_lot.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parking_lots/1
  def update
    if @parking_lot.update(parking_lot_params)
      render json: @parking_lot, serializer: ParkingLotSerializer, meta: { notice: t('parking_lots.update.success') }, status: :ok
    else
      render json: { errors: @parking_lot.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /parking_lots/1
  def destroy
    @parking_lot.destroy
    if @parking_lot.destroyed?
      render json: { meta: { notice: t('parking_lots.destroy.success') } }, status: :ok
    else
      render json: { errors: { alert: t('parking_lots.destroy.error') } }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_parking_lot
    @parking_lot = ParkingLot.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def parking_lot_params
    params.require(:parking_lot).permit(:slot_number, :status, :distance_from_entry_point)
  end
end
