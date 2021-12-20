require 'test_helper'

class CashEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cash_entry = cash_entries(:one)
  end

  test "should get index" do
    get cash_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_cash_entry_url
    assert_response :success
  end

  test "should create cash_entry" do
    assert_difference('CashEntry.count') do
      post cash_entries_url, params: { cash_entry: { amount: @cash_entry.amount, description: @cash_entry.description, type: @cash_entry.type, user_id: @cash_entry.user_id } }
    end

    assert_redirected_to cash_entry_url(CashEntry.last)
  end

  test "should show cash_entry" do
    get cash_entry_url(@cash_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_cash_entry_url(@cash_entry)
    assert_response :success
  end

  test "should update cash_entry" do
    patch cash_entry_url(@cash_entry), params: { cash_entry: { amount: @cash_entry.amount, description: @cash_entry.description, type: @cash_entry.type, user_id: @cash_entry.user_id } }
    assert_redirected_to cash_entry_url(@cash_entry)
  end

  test "should destroy cash_entry" do
    assert_difference('CashEntry.count', -1) do
      delete cash_entry_url(@cash_entry)
    end

    assert_redirected_to cash_entries_url
  end
end
