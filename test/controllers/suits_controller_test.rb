require 'test_helper'

class SuitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @suit = suits(:one)
  end

  test "should get index" do
    get suits_url
    assert_response :success
  end

  test "should get new" do
    get new_suit_url
    assert_response :success
  end

  test "should create suit" do
    assert_difference('Suit.count') do
      post suits_url, params: { suit: { client_id: @suit.client_id, descricao: @suit.descricao, lawyer: @suit.lawyer } }
    end

    assert_redirected_to suit_url(Suit.last)
  end

  test "should show suit" do
    get suit_url(@suit)
    assert_response :success
  end

  test "should get edit" do
    get edit_suit_url(@suit)
    assert_response :success
  end

  test "should update suit" do
    patch suit_url(@suit), params: { suit: { client_id: @suit.client_id, descricao: @suit.descricao, lawyer: @suit.lawyer } }
    assert_redirected_to suit_url(@suit)
  end

  test "should destroy suit" do
    assert_difference('Suit.count', -1) do
      delete suit_url(@suit)
    end

    assert_redirected_to suits_url
  end
end
