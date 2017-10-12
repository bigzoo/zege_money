class AddToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column(:users,:first_name,:string)
    add_column(:users,:last_name,:string)
    add_column(:users,:phone_number,:string)
    add_column(:users,:phone_number_verified,:string)
  end
end
