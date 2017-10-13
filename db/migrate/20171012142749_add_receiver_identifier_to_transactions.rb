class AddReceiverIdentifierToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :receiver_identifier, :string
  end
end
