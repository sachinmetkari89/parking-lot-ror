require 'rails_helper'

# t.integer "parking_lot_id", null: false
# t.string "number", null: false
# t.string "car_reg_number", null: false
# t.string "car_color", null: false
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["number"], name: "index_tickets_on_number", unique: true

RSpec.describe Ticket, type: :model do
  context 'validations' do
    it 'parking_lot is required' do
      ticket = build(:ticket)
      ticket.parking_lot = nil
      def ticket.assign_parking_slot; end
      expect(ticket.valid?).to be_falsy
    end

    it 'car_reg_number is required' do
      ticket = build(:ticket)
      ticket.car_reg_number = nil
      expect(ticket.valid?).to be_falsy
    end

    it 'car_color is required' do
      ticket = build(:ticket)
      ticket.car_color = nil
      expect(ticket.valid?).to be_falsy
    end

    it 'car_reg_number should be unique' do
      ticket = create(:ticket)

      new_ticket = build(:ticket, car_reg_number: ticket.car_reg_number)
      expect(new_ticket.valid?).to be_falsy

      new_ticket.car_reg_number = ticket.car_reg_number + '001'
      expect(new_ticket.valid?).to be_truthy
    end

    it "car_color should be one of #{Ticket::CAR_COLORS.join(', ')}" do
      ticket = build(:ticket)
      ticket.car_color = 'TEMP'
      expect(ticket.valid?).to be_falsy
    end

    it 'parking_lot_id should be associated with a parking_lot' do
      ticket = build(:ticket)
      ticket.parking_lot_id = -1
      def ticket.assign_parking_slot; end
      expect(ticket.valid?).to be_falsy
    end
  end
end
