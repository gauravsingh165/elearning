require "test_helper"

class TextbookControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get textbook_index_url
    assert_response :success
  end

  test "should get new" do
    get textbook_new_url
    assert_response :success
  end

  test "should get edit" do
    get textbook_edit_url
    assert_response :success
  end

  test "should get create" do
    get textbook_create_url
    assert_response :success
  end

  test "should get destroy" do
    get textbook_destroy_url
    assert_response :success
  end

  test "should get show" do
    get textbook_show_url
    assert_response :success
  end
end
