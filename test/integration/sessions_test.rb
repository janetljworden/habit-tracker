require "test_helper"

class SessionsTest < ActionDispatch::IntegrationTest
  test "users can login" do
    user = FactoryBot.create :user, email: "testlogin@test.com", password: "secret"

    visit root_path

    click_on "Login"

    fill_in "Email", with: "testlogin@test.com"
    fill_in "Password", with: "secret"
    click_button "Login"

    assert_equal page.current_path, habits_path
    assert_text "Logged in"
    assert_text "Logout"
    refute page.has_content?("Login")
  end

  test "users cannot login with wrong password" do
    user = FactoryBot.create :user, email: "testlogin@test.com", password: "secret"

    visit login_path

    fill_in "Email", with: "testlogin@test.com"
    fill_in "Password", with: "wrong"
    click_button "Login"

    assert_text "Invalid"
    refute page.has_content?("Logout")
  end

  test "users can logout" do
    login_user name: "Sterling"

    visit habits_path
    assert_text "Sterling"

    click_on "Logout"

    assert_text "Logged out"
    refute page.has_content?("Logout")
  end
end
