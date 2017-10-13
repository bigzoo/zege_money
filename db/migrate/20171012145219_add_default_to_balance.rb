class AddDefaultToBalance < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :balance, :string, :default => '0'
  end
end
