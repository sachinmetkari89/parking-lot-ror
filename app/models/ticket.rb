class Ticket < ApplicationRecord
  # Constants
  TICKET_NUMBER_PREPEND = "Ticket-No:"
  CAR_COLORS = %w[white black gray silver red blue brown green beige orange gold yellow purple].freeze

  # Modules

  # Validations
  validates :car_reg_number, presence: true, uniqueness: true
  validates :car_color, inclusion: { in: CAR_COLORS }, presence: true

  # scopes
  scope :with_car_color, ->(color) { where(car_color: color) }
  scope :with_car_reg_number, ->(reg_number) { where(car_reg_number: reg_number) }

  # Associations
  belongs_to :parking_lot, inverse_of: :ticket

  # Callbacks
  before_validation :assign_parking_slot
  after_create_commit :update_parking_lot_status
  after_destroy :free_parking_slot

  def number
    "#{TICKET_NUMBER_PREPEND}#{id}"
  end

  private

  def assign_parking_slot
    if nearest_parking_slot_from_entry_point = ParkingLot.unallocated_parking_slots.order(distance_from_entry_point: :asc).first.presence
      self.parking_lot_id = nearest_parking_slot_from_entry_point.id
    else
      errors.add(:base, "Parking lots not exist")
    end
  end

  def free_parking_slot
    parking_lot.update(status: ParkingLot::UNALLOCATED)
  end

  def update_parking_lot_status
    parking_lot.update(status: ParkingLot::ALLOCATED)
  end
end
