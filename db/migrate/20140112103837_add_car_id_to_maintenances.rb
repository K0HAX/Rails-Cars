class AddCarIdToMaintenances < ActiveRecord::Migration
  def change
    add_column :maintenances, :car_id, :integer
  end
end
