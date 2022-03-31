class DropCriteriaBulletins < ActiveRecord::Migration[5.2]
  def change
    drop_table :criteria_bulletins
  end
end
