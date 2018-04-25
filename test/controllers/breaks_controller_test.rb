require 'test_helper'

class BreaksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @break = breaks(:one)
  end

  test "should get index" do
    get breaks_url
    assert_response :success
  end

  test "should get new" do
    get new_break_url
    assert_response :success
  end

  test "should create break" do
    assert_difference('Break.count') do
      post breaks_url, params: { break: { clock_in_time: @break.clock_in_time, clock_out_time: @break.clock_out_time, shift_id: @break.shift_id } }
    end

    assert_redirected_to break_url(Break.last)
  end

  test "should show break" do
    get break_url(@break)
    assert_response :success
  end

  test "should get edit" do
    get edit_break_url(@break)
    assert_response :success
  end

  test "should update break" do
    patch break_url(@break), params: { break: { clock_in_time: @break.clock_in_time, clock_out_time: @break.clock_out_time, shift_id: @break.shift_id } }
    assert_redirected_to break_url(@break)
  end

  test "should destroy break" do
    assert_difference('Break.count', -1) do
      delete break_url(@break)
    end

    assert_redirected_to breaks_url
  end
end
