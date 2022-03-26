class CreateSublistSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :sublist_subs do |t|
      t.integer :subscriber_list_id
      t.integer :subscriber_id
    end
  end
end
