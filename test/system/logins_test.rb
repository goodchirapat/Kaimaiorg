require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  
  test "test login with wrong password" do
    visit login_url
     @user = users(:one)
    assert_selector "label", text: "Email"
    fill_in "email", with:@user.email

    assert_selector "label", text: "Password"
    fill_in "Password", with:'123456667'
    click_on "OK"
    assert_text "wrong username or password"
  end

  test "test login" do
    visit login_url
     @user = users(:one)
    assert_selector "label", text: "Email" ,visible: false
    fill_in "email", with:@user.email

    assert_selector "label", text: "Password"
    fill_in "password", with:"password"
    click_on "OK"
  end

  test "test password field" do
    visit login_url
     @user = users(:one)
  

    assert_selector "label", text: "Password"
    fill_in "password", with:"password"
  end

   

   

  
end