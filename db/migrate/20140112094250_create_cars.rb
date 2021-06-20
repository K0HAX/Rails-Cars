class CreateCars < ActiveRecord::Migration[4.2]
  def change
    create_table :cars do |t|
      t.string :Make
      t.string :Model
      t.decimal :Cost
      t.text :Description

      t.timestamps
    end
  end
end
