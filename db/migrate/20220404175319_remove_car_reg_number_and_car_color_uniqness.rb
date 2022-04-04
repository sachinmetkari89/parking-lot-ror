class RemoveCarRegNumberAndCarColorUniqness < ActiveRecord::Migration[5.1]
  def change
    remove_index :tickets, column: %i[car_reg_number car_color]
  end
end
