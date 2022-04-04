# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
50.times do |number|
  parking_lot = ParkingLot.new
  parking_lot.slot_number = 'A' + (number + 1).to_s
  parking_lot.status = 'unallocated'
  parking_lot.distance_from_entry_point = (10 * (number + 1))
  parking_lot.save!
end

50.times do |number|
  parking_lot = ParkingLot.new
  parking_lot.slot_number = 'B' + (number + 1).to_s
  parking_lot.status = 'unallocated'
  parking_lot.distance_from_entry_point = (10 * (number + 1))
  parking_lot.save!
end
