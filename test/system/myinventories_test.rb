require "application_system_test_case"

class MyinventoriesTest < ApplicationSystemTestCase
    setup do
        visit login_url
        @user = users(:three)
        fill_in "email", with:@user.email
        fill_in "Password", with:"password"
        click_on "OK"
    end
  
    test "check show sale history table" do
        visit my_inventory_url
        assert_selector "#my_inventory_table"
    end

  test "delete item" do
        visit my_inventory_url
        assert_selector "#my_inventory_table"
        click_on "Delete", match: :first
        assert_text "Market was successfully destroyed"
    end

    test "edit item" do
        visit my_inventory_url
        click_on "Edit", match: :first
        assert_no_text "User" 
        assert_no_text "Item" 
        assert_text "Price" 
        assert_text "Stock" 
    end

    test "new item" do
        visit my_inventory_url
        click_on "NEW", match: :first
        assert_no_text "User" 
        assert_text "Item" 
        assert_text "Price" 
        assert_text "Stock" 
    end

end