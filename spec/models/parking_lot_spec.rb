require 'rails_helper'

# t.string "slot_number", null: false
# t.string "status", null: false
# t.integer "distance_from_entry_point"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["slot_number"], name: "index_parking_lots_on_slot_number", unique: true

RSpec.describe ParkingLot, type: :model do
  context 'validations' do
    it 'slot_number is required' do
      parking_lot = build(:parking_lot)
      parking_lot.slot_number = nil
      expect(parking_lot.valid?).to be_falsy
    end

    it 'status is required' do
      parking_lot = build(:parking_lot)
      parking_lot.status = nil
      expect(parking_lot.valid?).to be_falsy
    end

    it 'distance_from_entry_point is required' do
      parking_lot = build(:parking_lot)
      parking_lot.distance_from_entry_point = nil
      expect(parking_lot.valid?).to be_falsy
    end

    it 'slot_number should be unique' do
      parking_lot = create(:parking_lot)

      new_parking_lot = build(:parking_lot, slot_number: parking_lot.slot_number)
      expect(new_parking_lot.valid?).to be_falsy

      new_parking_lot.slot_number = parking_lot.slot_number + 'TEMP'
      expect(new_parking_lot.valid?).to be_truthy
    end

    it "status should be one of #{ParkingLot::STATUS.join(', ')}" do
      parking_lot = build(:parking_lot)
      parking_lot.status = 'TEMP'
      expect(parking_lot.valid?).to be_falsy
    end
  end

  context 'associations' do
    it 'can not be updated if it has tickets' do
      parking_lot = create(:parking_lot)
      create(:ticket, parking_lot: parking_lot)

      parking_lot.reload
      expect(parking_lot.status).to eq('allocated')

      expect(parking_lot.update(slot_number: parking_lot.slot_number + 'TMP')).to be_falsy
      expect(parking_lot.update(status: 'unallocated')).to be_falsy
    end

    it 'can be updated if it has no tickets' do
      parking_lot = create(:parking_lot)

      expect(parking_lot.update(slot_number: parking_lot.slot_number + 'TMP')).to be_truthy
    end
  end
end
