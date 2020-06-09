class UpdateUsersAdmin < ActiveRecord::Migration[5.2]
  def up
    User.where("admin = 't'").update_all(admin: 1)
    User.where("admin = 'f'").update_all(admin: 0)
  end

  def down
    User.where("admin = 1").update_all(admin: 't')
    User.where("admin = 0").update_all(admin: 'f')
  end
end
