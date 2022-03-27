class CreateSublistBulletins < ActiveRecord::Migration[5.2]
  def change
    create_table :sublist_bulletins do |t|
      t.integer :subscriber_list_id
      t.integer :bulletin_id
    end
  end
end
