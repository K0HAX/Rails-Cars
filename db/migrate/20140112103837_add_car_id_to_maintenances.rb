class AddCarIdToMaintenances < ActiveRecord::Migration[4.2]
  def change
    add_column :maintenances, :car_id, :integer
  end
end
