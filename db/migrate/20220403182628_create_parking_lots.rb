class CreateParkingLots < ActiveRecord::Migration[5.1]
  def change
    create_table :parking_lots do |t|
      t.string :slot_number, null: false
      t.string :status, null: false
      t.integer :distance_from_entry_point

      t.timestamps
    end
    add_index :parking_lots, :slot_number, unique: true
    add_index :parking_lots, %i[slot_number status], unique: true
  end
end
