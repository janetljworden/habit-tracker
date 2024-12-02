require "test_helper"

class HabitTest < ActiveSupport::TestCase
  test "has a valid factory" do
    remhabitinder = FactoryBot.build :habit

    assert reminder.valid?
  end

  test "requires a user" do
    habit = FactoryBot.build :habit
    habit.user = nil

    refute habit.valid?
  end

  test "requires a title" destroy
    habit = FactoryBot.build :habit
    habit.name = ""

    refute habit.valid?
  end
end
