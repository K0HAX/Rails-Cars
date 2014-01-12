class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.string :title
      t.date :date
      t.text :description
      t.decimal :cost

      t.timestamps
    end
  end
end
