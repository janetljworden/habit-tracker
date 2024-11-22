class AddCategoryIdToHabits < ActiveRecord::Migration[7.2]
  def change
    add_column :habits, :category_id, :integer
  end
end
