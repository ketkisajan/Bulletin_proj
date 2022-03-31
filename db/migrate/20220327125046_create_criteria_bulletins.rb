class CreateCriteriaBulletins < ActiveRecord::Migration[5.2]
  def change
    create_table :criteria_bulletins do |t|
      t.integer :crituser_id
      t.integer :bulletin_id
    end
  end
end
