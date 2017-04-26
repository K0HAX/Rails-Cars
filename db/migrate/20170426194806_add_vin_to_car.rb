class AddVinToCar < ActiveRecord::Migration
  def change
    add_column :cars, :vin, :string
  end
end
