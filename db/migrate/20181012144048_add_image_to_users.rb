class AddImageToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
  t.attachment :image
end
  end
end
