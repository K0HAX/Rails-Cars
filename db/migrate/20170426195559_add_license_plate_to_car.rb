class AddLicensePlateToCar < ActiveRecord::Migration
  def change
    add_column :cars, :License_Plate, :string
  end
end
