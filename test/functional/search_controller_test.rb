require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get standard" do
    get :standard
    assert_response :success
  end

  test "should get reverse" do
    get :reverse
    assert_response :success
  end

end
