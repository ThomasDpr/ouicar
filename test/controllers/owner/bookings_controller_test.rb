require "test_helper"

class Owner::BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get owner_bookings_index_url
    assert_response :success
  end

  test "should get accept" do
    get owner_bookings_accept_url
    assert_response :success
  end

  test "should get decline" do
    get owner_bookings_decline_url
    assert_response :success
  end

  test "should get cancel" do
    get owner_bookings_cancel_url
    assert_response :success
  end
end
