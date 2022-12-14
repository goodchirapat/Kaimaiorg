require "application_system_test_case"

class MainsTest < ApplicationSystemTestCase

  test "test access without login my market" do
        visit my_market_url
        assert_text "You must login first"
    end

  test "access mymarket page by seller account" do
    visit login_url
    @user = users(:three)
    fill_in "email", with:@user.email
    fill_in "Password", with:"password"
    click_on "OK"
    visit my_market_url
    assert_text "You can't access this page"
  end

  test "access mymarket page by buyer or admin account" do
    visit login_url
    @user = users(:two)
    fill_in "email", with:@user.email
    fill_in "Password", with:"password"
    click_on "OK"
    visit my_market_url
    assert_text "Item"
    assert_text "Category"
    assert_text "Picture"
    assert_text "Price"
    assert_text "Stock"
    assert_text "Buy"
  end

  test "check search category" do
    visit login_url
    @user = users(:two)
    fill_in "email", with:@user.email
    fill_in "Password", with:"password"
    click_on "OK"
    visit my_market_url
    @item = items(:pork)
    fill_in "Category:", with: @item.category
    assert_selector "td", text: @item.category
  end

  test "buy more than stock" do
    visit login_url
    @user = users(:two)
    fill_in "email", with:@user.email
    fill_in "Password", with:"password"
    click_on "OK"
    visit my_market_url
    click_on "Buy" , match: :first
    fill_in "qty", with: 100
    click_on "Confirm buying"
    assert_text "The stock is not enough!"
  end

  test "buy less than stock" do
    visit login_url
    @user = users(:two)
    fill_in "email", with:@user.email
    fill_in "Password", with:"password"
    click_on "OK"
    visit my_market_url
    click_on "Buy" , match: :first
    fill_in "qty", with: 1
    click_on "Confirm buying"
    assert_text "Purchase success!"
    
  end
end