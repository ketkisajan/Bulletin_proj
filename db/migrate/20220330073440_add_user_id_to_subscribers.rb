class AddUserIdToSubscribers < ActiveRecord::Migration[5.2]
  def change
    add_column :subscribers, :user_id, :int
  end
end
