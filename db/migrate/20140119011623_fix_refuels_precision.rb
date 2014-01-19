class FixRefuelsPrecision < ActiveRecord::Migration
  def change
    change_column :refuels, :miles, :decimal, :precision => 16, :scale => 2
    change_column :refuels, :price, :decimal, :precision => 16, :scale => 2
    change_column :refuels, :gallons, :decimal, :precision => 16, :scale => 2

    change_column :maintenances, :cost, :decimal, :precision => 16, :scale => 2

    change_column :cars, :Cost, :decimal, :precision => 16, :scale => 2
  end
end
