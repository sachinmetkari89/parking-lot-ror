class RemoveNumberFromTicketTable < ActiveRecord::Migration[5.1]
  def change
    remove_index :tickets, column: %i[number]
    remove_column :tickets, :number
  end
end
