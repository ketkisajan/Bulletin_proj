class CreateCritusers < ActiveRecord::Migration[5.2]
  def change
    create_table :critusers do |t|
      t.string :user_criteria, limit: 130
    end
  end
end
