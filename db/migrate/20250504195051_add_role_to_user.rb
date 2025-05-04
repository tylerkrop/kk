class AddRoleToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :role, :integer, default: 0
    for user in User.all
      user.update(role: 0)
    end
    change_column_null :users, :role, false
  end
end
