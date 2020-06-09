class RemoveUserFromCar < ActiveRecord::Migration[5.2]
  def change
    remove_reference :cars, :user_id, foreign_key: true
  end
end
