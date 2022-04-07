class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token

  # GET /tickets
  def index
    @tickets = Ticket.all
    render json: @tickets, each_serializer: TicketSerializer, status: :ok
  end

  # GET /tickets/1
  def show
    render json: @ticket, serializer: TicketSerializer, status: :ok
  end

  # POST /tickets
  def create
    ticket = Ticket.new(ticket_params)
    if ticket.save
      render json: ticket, serializer: TicketSerializer, meta: { notice: t('tickets.new.success') }, status: :created
    else
      render json: { errors: ticket.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_params)
      render json: @ticket, serializer: TicketSerializer, meta: { notice: t('tickets.update.success') }, status: :ok
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

  # 1: Registration numbers of all cars of a particular Color.
  def car_registration_numbers_with_car_color
    car_reg_numbers  = Ticket.with_car_color(params[:color]).pluck(:car_reg_number)
    render json: car_reg_numbers
  end
  
  # 2: Ticket number in which a car with a given registration number is placed.
  def ticket_number_with_car_reg_number
    ticket_number  = Ticket.with_car_reg_number(params[:reg_number]).try(:first).try(:number)
    render json: ticket_number
  end

  # 3: Ticket numbers of all ticket where a car of a particular color is placed.
  def ticket_numbers_with_car_color
    ticket_numbers  = Ticket.with_car_color(params[:color]).collect(&:number)
    render json: ticket_numbers
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
