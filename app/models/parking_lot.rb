class ParkingLot < ApplicationRecord
  STATUS = %w[allocated unallocated].freeze

  # Validations
  validates :slot_number, presence: true, uniqueness: true
  validates :status, presence: true

  # scopes
  scope :allocated_parking_slots, -> { where(status: 'allocated') }
  scope :unallocated_parking_slots, -> { where(status: 'unallocated') }

  # Associations
  has_one :ticket, inverse_of: :parking_lot
end
