class AddUserIdToHabits < ActiveRecord::Migration[7.2]
  def change
    add_column :habits, :user_id, :integer
  end
end
