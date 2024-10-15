class CreateHabits < ActiveRecord::Migration[7.2]
  def change
    create_table :habits do |t|
      t.string :name
      t.string :frequency
      t.datetime :start_date

      t.timestamps
    end
  end
end
