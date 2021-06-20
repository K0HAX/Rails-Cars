class AddDetailsToCars < ActiveRecord::Migration[4.2]
  def change
    add_column :cars, :year, :integer
    add_column :cars, :in_inventory, :boolean
  end
end
