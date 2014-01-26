class AddUserIdToMaintenance < ActiveRecord::Migration
  def change
    add_column :maintenances, :user_id, :integer
  end
end
