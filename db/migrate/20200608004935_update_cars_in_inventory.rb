class UpdateCarsInInventory < ActiveRecord::Migration[5.2]
  def up
    Car.where("in_inventory = 't'").update_all(in_inventory: 1)
    Car.where("in_inventory = 'f'").update_all(in_inventory: 0)
  end

  def down
    Car.where("in_inventory = 1").update_all(in_inventory: 't')
    Car.where("in_inventory = 0").update_all(in_inventory: 'f')
  end
end

