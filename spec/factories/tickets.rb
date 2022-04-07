FactoryBot.define do
  factory :ticket do
    parking_lot { create :parking_lot }

    sequence(:car_reg_number) { |n| "C#{n}" }
    sequence(:car_color) { Ticket::CAR_COLORS.sample }
  end
end
