require "test_helper"

class Owner::CarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owner_cars_index_url
    assert_response :success
  end

  test "should get new" do
    get owner_cars_new_url
    assert_response :success
  end

  test "should get create" do
    get owner_cars_create_url
    assert_response :success
  end

  test "should get edit" do
    get owner_cars_edit_url
    assert_response :success
  end

  test "should get update" do
    get owner_cars_update_url
    assert_response :success
  end

  test "should get destroy" do
    get owner_cars_destroy_url
    assert_response :success
  end
end
