require 'test_helper'

class AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get account_signup_url
    assert_response :success
  end

  test "should get signin" do
    get account_signin_url
    assert_response :success
  end

  test "should get signout" do
    get account_signout_url
    assert_response :success
  end

end
