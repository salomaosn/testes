require 'test_helper'

class PiusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @piu = pius(:one)
  end

  test "should get index" do
    get pius_url
    assert_response :success
  end

  test "should get new" do
    get new_piu_url
    assert_response :success
  end

  test "should create piu" do
    assert_difference('Piu.count') do
      post pius_url, params: { piu: { content: @piu.content, user_id: @piu.user_id } }
    end

    assert_redirected_to piu_url(Piu.last)
  end

  test "should show piu" do
    get piu_url(@piu)
    assert_response :success
  end

  test "should get edit" do
    get edit_piu_url(@piu)
    assert_response :success
  end

  test "should update piu" do
    patch piu_url(@piu), params: { piu: { content: @piu.content, user_id: @piu.user_id } }
    assert_redirected_to piu_url(@piu)
  end

  test "should destroy piu" do
    assert_difference('Piu.count', -1) do
      delete piu_url(@piu)
    end

    assert_redirected_to pius_url
  end
end
