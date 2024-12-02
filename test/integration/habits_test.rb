require "test_helper"

class HabitsTest < ActionDispatch::IntegrationTest
  test "habits page shows only logged in users habits" do
    user = login_user
    puts "Logged in user: #{user.inspect}"
    habit1 = FactoryBot.create :habit, user: user
    puts "Created habit1: #{habit1.inspect}"
    habit2 = FactoryBot.create :habit, user: user
    habit3 = FactoryBot.create :habit
    puts "Created habit3: #{habit3.inspect}"
    visit habits_path

    assert_text habit1.name
    assert_text habit2.name
    refute page.has_content?(habit3.name)
  end
end
