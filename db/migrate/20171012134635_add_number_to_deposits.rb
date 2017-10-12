class AddNumberToDeposits < ActiveRecord::Migration[5.1]
  def change
    add_column :deposits, :phone_number, :string
  end
end
