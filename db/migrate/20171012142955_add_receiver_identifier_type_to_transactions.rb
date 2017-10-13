class AddReceiverIdentifierTypeToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :receiver_identifier_type, :string
  end
end
