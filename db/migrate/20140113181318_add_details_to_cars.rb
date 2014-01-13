class AddDetailsToCars < ActiveRecord::Migration
  def change
    add_column :cars, :year, :integer
    add_column :cars, :in_inventory, :boolean
  end
end
