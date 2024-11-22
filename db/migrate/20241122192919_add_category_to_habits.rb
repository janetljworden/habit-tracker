class AddCategoryToHabits < ActiveRecord::Migration[7.2]
  def change
    add_column :habits, :category, :string
  end
end
