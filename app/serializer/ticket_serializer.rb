class TicketSerializer < ActiveModel::Serializer
  attributes :id, :parking_lot_id, :car_reg_number, :car_color, :number, :parking_lot_number

  def parking_lot_number
    object.try(:parking_lot).try(:slot_number)
  end
end
