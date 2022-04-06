class ParkingLot < ApplicationRecord
  ALLOCATED = 'allocated'
  UNALLOCATED = 'unallocated'
  STATUS = %w[ALLOCATED UNALLOCATED].freeze

  # Validations
  validates :slot_number, presence: true, uniqueness: true
  validates :status, presence: true

  # scopes
  scope :allocated_parking_slots, -> { where(status: ALLOCATED) }
  scope :unallocated_parking_slots, -> { where(status: UNALLOCATED) }

  # Associations
  has_one :ticket, inverse_of: :parking_lot
end
