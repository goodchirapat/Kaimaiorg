require "application_system_test_case"

class PurchaseHistoriesTest < ApplicationSystemTestCase

  test "check show purchase history table" do
    visit login_url
    @user = users(:two)
    fill_in "email", with:@user.email
    fill_in "Password", with:"password"
    click_on "OK"
    visit purchase_history_url
    assert_selector "#purchase_history_table"
  end

end