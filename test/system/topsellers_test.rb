require "application_system_test_case"

class TopsellersTest < ApplicationSystemTestCase
    setup do
        visit login_url
        @user = users(:three)
        fill_in "email", with:@user.email
        fill_in "Password", with:"password"
        click_on "OK"
    end

    test "search field" do
        visit top_seller_filter_url
        assert_text "Start date"
        assert_text "Stop date"
    end
  
    test "search check" do
        visit top_seller_filter_url
        fill_in "start", with:"12-1-2020"
        fill_in "stop", with:"12-1-2024"
        click_on "Search"
        assert_selector "table#qty"
        assert_selector "table#price"
    end
end