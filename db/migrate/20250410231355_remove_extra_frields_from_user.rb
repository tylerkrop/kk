class RemoveExtraFrieldsFromUser < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :email, :string
    remove_column :users, :reset_password_token, :string
    remove_column :users, :reset_password_sent_at, :datetime
  end
end
