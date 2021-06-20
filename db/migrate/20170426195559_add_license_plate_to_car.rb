class AddLicensePlateToCar < ActiveRecord::Migration[4.2]
  def change
    add_column :cars, :License_Plate, :string
  end
end
