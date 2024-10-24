class CreateEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :entries do |t|
      t.integer :habit_id
      t.datetime :date
      t.string :status
      t.text :notes

      t.timestamps
    end
  end
end
