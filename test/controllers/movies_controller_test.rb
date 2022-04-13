require 'test_helper'

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get movies_create_url
    assert_response :success
  end

  test "should get update" do
    get movies_update_url
    assert_response :success
  end

  test "should get destroy" do
    get movies_destroy_url
    assert_response :success
  end

end
