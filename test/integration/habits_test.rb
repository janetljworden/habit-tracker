require "test_helper"

class HabitsTest < ActionDispatch::IntegrationTest
  test "only logged in users can see reminders" do
    visit root_path
    refute page.has_content?("My Habits")

    visit habits_path

    assert_equal page.current_path, root_path
    assert_text "Invalid"
  end

  test "habits page shows only logged in users habits" do
    user = login_user
    #puts "Logged in user: #{user.inspect}"
    habit1 = FactoryBot.create :habit, user: user
    #puts "Created habit1: #{habit1.inspect}"
    habit2 = FactoryBot.create :habit, user: user
    #puts "Created habit2: #{habit2.inspect}"
    habit3 = FactoryBot.create :habit
    #puts "Created habit3: #{habit3.inspect}"
    visit habits_path

    assert_text habit1.name
    assert_text habit2.name
    refute page.has_content?(habit3.name)
  end

  test "users can create a new habit" do
    user = login_user

    category = FactoryBot.create :category, user: user
    
    visit habits_path

    click_on "New Habit"

    fill_in "Name", with: "Habit Test"
    select category.title, from: "Category"
    fill_in "Frequency", with: "Daily"
    fill_in "Start date", with: Date.today.to_s

    click_button "Create"

    assert_text "Created"
  end

end
