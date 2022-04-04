class RemoveSlotNumberStatusUniqness < ActiveRecord::Migration[5.1]
  def change
    remove_index :parking_lots, column: %i[slot_number status]
  end
end
