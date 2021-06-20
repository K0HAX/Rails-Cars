class AddVinToCar < ActiveRecord::Migration[4.2]
  def change
    add_column :cars, :vin, :string
  end
end
