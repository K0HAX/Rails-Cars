class AddUserIdToMaintenance < ActiveRecord::Migration[4.2]
  def change
    add_column :maintenances, :user_id, :integer
  end
end
