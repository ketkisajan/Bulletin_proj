class CreateBulletins < ActiveRecord::Migration[5.2]
  def change
    create_table :bulletins do |t|
      t.string :subject , limit: 400, null: false
      t.string :from_address, limit: 130, null: false
      t.text :body
      t.text :header
      t.text :footer
      t.integer :subs_list_id
      t.string :sent_flag
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
