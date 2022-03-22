class AddUserIdToSubscriberLists < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriber_lists, :user_id, :integer
  end
end
