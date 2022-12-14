require "application_system_test_case"

class MainsTest < ApplicationSystemTestCase

  test "test access without login" do
        visit main_url
        assert_text "You must login first"
    end

  test "should show information for admin" do
    visit login_url
    @user = users(:one)
    fill_in "email", with:@user.email
    fill_in "Password", with:"password"
    click_on "OK"
    @menus = ["Profile", "My Market", "Purchase History", "My Inventory", "Sale History", "Top Seller"]
    @menus.each do |menu|
      visit main_url
      assert_text menu
      click_on menu
      assert_text menu
    end
    visit main_url
    assert_text "LOG OUT"
    click_on "LOG OUT"
  end

  test "check menu of buyer" do
    visit login_url
    @user = users(:two)
    fill_in "email", with:@user.email
    fill_in "Password", with:"password"
    click_on "OK"
    @menus = ["Profile", "My Market", "Purchase History"]
    @menus.each do |menu|
      visit main_url
      assert_text menu
      click_on menu
      assert_text menu
    end
    visit main_url
    assert_text "LOG OUT"
    click_on "LOG OUT"
    
  end
  test "check menu of seller" do
    visit login_url
    @user = users(:three)
    fill_in "email", with:@user.email
    fill_in "Password", with:"password"
    click_on "OK"
    @menus = ["Profile", "Sale History", "Top Seller"]
    @menus.each do |menu|
      visit main_url
      assert_text menu
      click_on menu
      assert_text menu
    end
    visit main_url
    assert_text "LOG OUT"
    click_on "LOG OUT"
  end

end