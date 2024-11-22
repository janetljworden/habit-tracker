class RemoveCategoryFromHabits < ActiveRecord::Migration[7.2]
  def change
    remove_column :habits, :category, :string
  end
end
