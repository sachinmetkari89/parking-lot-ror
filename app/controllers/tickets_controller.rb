class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show edit update destroy]

  # GET /tickets
  def index
    @tickets = Ticket.all
    render json: @tickets, status: :ok
  end

  # GET /tickets/1
  def show
    render json: @ticket, status: :ok
  end

  # POST /tickets
  def create
    ticket = Ticket.new(ticket_params)
    if ticket.save
      render json: ticket, meta: { notice: t('tickets.new.success') }, status: :created
    else
      render json: { errors: ticket.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_params)
      render json: @ticket, meta: { notice: t('tickets.update.success') }, status: :ok
    else
      render json: { errors: @ticket.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy
    if @ticket.destroyed?
      render json: { meta: { notice: t('tickets.destroy.success') } }, status: :ok
    else
      render json: { errors: { alert: t('tickets.destroy.error') } }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def ticket_params
    params.require(:ticket).permit(:car_reg_number, :car_color)
  end
end
