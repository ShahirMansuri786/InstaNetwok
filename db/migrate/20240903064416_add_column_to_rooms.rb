class AddColumnToRooms < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :created_by, :integer
    add_column :rooms, :created_for, :integer
  end
end
