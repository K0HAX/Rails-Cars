class CreateRefuels < ActiveRecord::Migration[4.2]
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
