Rails.application.routes.draw do
  resources :tickets do
    collection do
      get :car_registration_numbers_with_car_color
      get :ticket_numbers_with_car_color
      get :ticket_number_with_car_reg_number
    end
  end
  resources :parking_lots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
