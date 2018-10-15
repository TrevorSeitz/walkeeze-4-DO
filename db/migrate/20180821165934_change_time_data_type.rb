class ChangeTimeDataType < ActiveRecord::Migration[5.2]
  def change
    change_column :walks, :time, :string
  end
end
