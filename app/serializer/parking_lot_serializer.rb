class ParkingLotSerializer < ActiveModel::Serializer
  attributes :id, :slot_number, :status, :distance_from_entry_point
end
