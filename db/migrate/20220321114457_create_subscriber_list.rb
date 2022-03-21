class CreateSubscriberList < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriber_lists do |t|
      t.string :list_name
      t.string :list_type
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
