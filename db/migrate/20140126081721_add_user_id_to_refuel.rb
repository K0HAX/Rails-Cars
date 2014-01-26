class AddUserIdToRefuel < ActiveRecord::Migration
  def change
    add_column :refuels, :user_id, :integer
  end
end
