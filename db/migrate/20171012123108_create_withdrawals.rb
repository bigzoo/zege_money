class CreateWithdrawals < ActiveRecord::Migration[5.1]
  def change
    create_table :withdrawals do |t|
      t.integer :user_id
      t.string :amount

      t.timestamps
    end
  end
end
