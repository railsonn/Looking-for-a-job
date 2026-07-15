require "test_helper"

class JobAplicationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get job_aplication_index_url
    assert_response :success
  end

  test "should get edit" do
    get job_aplication_edit_url
    assert_response :success
  end

  test "should get show" do
    get job_aplication_show_url
    assert_response :success
  end

  test "should get new" do
    get job_aplication_new_url
    assert_response :success
  end
end
