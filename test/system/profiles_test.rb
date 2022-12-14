require "application_system_test_case"

class ProfilesTest < ApplicationSystemTestCase
    test "should show information for admin" do
        visit login_url
        @user = users(:one)
        fill_in "email", with:@user.email
        fill_in "Password", with:"password"
        click_on "OK"
        click_on "Profile"
        assert_text "Name"
        assert_text "Email"
        assert_text "User type"
        assert_text "Old password"
        assert_text "New password"
    end

    test "test Incomplete field" do
        visit login_url
        @user = users(:one)
        fill_in "email", with:@user.email
        fill_in "Password", with:"password"
        click_on "OK"
        click_on "Profile"
        fill_in "old_password", with:"password"
        click_on "Confirm changing password"
        assert_text "failed to change password"
    end

    test "test complete field" do
        visit login_url
        @user = users(:one)
        fill_in "email", with:@user.email
        fill_in "Password", with:"password"
        click_on "OK"
        click_on "Profile"
        fill_in "old_password", with:"password"
        fill_in "new_password", with:"password"
        click_on "Confirm changing password"
        assert_text "password change success"
    end

    test "test Incorrect old password" do
        visit login_url
        @user = users(:one)
        fill_in "email", with:@user.email
        fill_in "Password", with:"password"
        click_on "OK"
        click_on "Profile"
        fill_in "old_password", with:"1234"
        fill_in "new_password", with:"password"
        click_on "Confirm changing password"
        assert_text "failed to change password"
    end
end