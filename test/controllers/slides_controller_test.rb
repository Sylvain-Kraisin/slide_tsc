require 'test_helper'

class SlidesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get slides_index_url
    assert_response :success
  end

  test "should get admin" do
    get slides_admin_url
    assert_response :success
  end

end
