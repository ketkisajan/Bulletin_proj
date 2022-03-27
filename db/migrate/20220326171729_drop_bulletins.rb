class DropBulletins < ActiveRecord::Migration[5.2]
  def change
    drop_table :bulletins
  end
end
