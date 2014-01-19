class CreateRefuels < ActiveRecord::Migration
  def change
    create_table :refuels do |t|
      t.decimal :miles
      t.decimal :gallons
      t.decimal :price
      t.references :car, index: true

      t.timestamps
    end
  end
end
