require 'rails_helper'
RSpec.describe ParkingLot, type: :model do
  before(:all) do
    @parking_lot = create(:parking_lot)
  end

  it 'is valid with valid attributes' do
    expect(@parking_lot).to be_valid
  end
end
