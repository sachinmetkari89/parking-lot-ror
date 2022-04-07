FactoryBot.define do
  factory :parking_lot do
    sequence(:slot_number) { |n| "A#{n}" }
    status { 'unallocated' }
    sequence(:distance_from_entry_point) { |n| (n * rand(1..10)) }
  end
end
