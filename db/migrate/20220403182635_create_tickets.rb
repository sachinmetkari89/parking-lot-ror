class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.integer :parking_lot_id, null: false
      t.string :number, null: false
      t.string :car_reg_number, null: false
      t.string :car_color, null: false

      t.timestamps
    end
    add_index :tickets, :number, unique: true
    add_index :tickets, %i[car_reg_number car_color], unique: true
  end
end
