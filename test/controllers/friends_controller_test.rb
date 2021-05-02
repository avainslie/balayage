require "test_helper"

class stylistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stylist = stylists(:one)
  end

  test "should get index" do
    get stylists_url
    assert_response :success
  end

  test "should get new" do
    get new_stylist_url
    assert_response :success
  end

  test "should create stylist" do
    assert_difference('stylist.count') do
      post stylists_url, params: { stylist: { email: @stylist.email, first_name: @stylist.first_name, last_name: @stylist.last_name, phone: @stylist.phone, twitter: @stylist.twitter } }
    end

    assert_redirected_to stylist_url(stylist.last)
  end

  test "should show stylist" do
    get stylist_url(@stylist)
    assert_response :success
  end

  test "should get edit" do
    get edit_stylist_url(@stylist)
    assert_response :success
  end

  test "should update stylist" do
    patch stylist_url(@stylist), params: { stylist: { email: @stylist.email, first_name: @stylist.first_name, last_name: @stylist.last_name, phone: @stylist.phone, twitter: @stylist.twitter } }
    assert_redirected_to stylist_url(@stylist)
  end

  test "should destroy stylist" do
    assert_difference('stylist.count', -1) do
      delete stylist_url(@stylist)
    end

    assert_redirected_to stylists_url
  end
end
