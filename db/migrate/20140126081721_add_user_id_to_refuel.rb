class AddUserIdToRefuel < ActiveRecord::Migration[4.2]
  def change
    add_column :refuels, :user_id, :integer
  end
end
