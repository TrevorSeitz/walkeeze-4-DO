class AddImageToDogs < ActiveRecord::Migration[5.2]
  def change
    change_table :dogs do |t|
  t.attachment :image
end
  end
end
