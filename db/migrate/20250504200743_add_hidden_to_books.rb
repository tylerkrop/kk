class AddHiddenToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :hidden, :boolean, default: false
  end
end
