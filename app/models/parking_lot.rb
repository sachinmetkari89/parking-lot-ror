class ParkingLot < ApplicationRecord
  ALLOCATED = 'allocated'
  UNALLOCATED = 'unallocated'
  STATUS = [ALLOCATED, UNALLOCATED].freeze

  # Validations
  validates :slot_number, presence: true, uniqueness: true
  validates :status, :distance_from_entry_point, presence: true
  validates :status, inclusion: {in: STATUS}
  validate :can_not_be_updated_if_allocated

  # scopes
  scope :allocated_parking_slots, -> { where(status: ALLOCATED) }
  scope :unallocated_parking_slots, -> { where(status: UNALLOCATED) }

  # Associations
  has_one :ticket, inverse_of: :parking_lot

  private

  def can_not_be_updated_if_allocated
    if status_in_database == ALLOCATED && ticket.present?
      errors.add(:base, "Can not be updated")
    end
  end
end
