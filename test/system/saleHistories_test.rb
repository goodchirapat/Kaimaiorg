require "application_system_test_case"

class PurchaseHistoriesTest < ApplicationSystemTestCase

  test "check show sale history table" do
    visit login_url
    @user = users(:three)
    fill_in "email", with:@user.email
    fill_in "Password", with:"password"
    click_on "OK"
    visit sale_history_url
    assert_selector "#sale_history_table"
  end

end