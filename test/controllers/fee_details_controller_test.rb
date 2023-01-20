# frozen_string_literal: true

require 'test_helper'

class FeeDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fee_detail = fee_details(:one)
  end

  test 'should get index' do
    get fee_details_url
    assert_response :success
  end

  test 'should get new' do
    get new_fee_detail_url
    assert_response :success
  end

  test 'should create fee_detail' do
    assert_difference('FeeDetail.count') do
      post fee_details_url,
           params: { fee_detail: { month: @fee_detail.month, status: @fee_detail.status, student_id: @fee_detail.student_id,
                                   user_id: @fee_detail.user_id } }
    end

    assert_redirected_to fee_detail_url(FeeDetail.last)
  end

  test 'should show fee_detail' do
    get fee_detail_url(@fee_detail)
    assert_response :success
  end

  test 'should get edit' do
    get edit_fee_detail_url(@fee_detail)
    assert_response :success
  end

  test 'should update fee_detail' do
    patch fee_detail_url(@fee_detail),
          params: { fee_detail: { month: @fee_detail.month, status: @fee_detail.status, student_id: @fee_detail.student_id,
                                  user_id: @fee_detail.user_id } }
    assert_redirected_to fee_detail_url(@fee_detail)
  end

  test 'should destroy fee_detail' do
    assert_difference('FeeDetail.count', -1) do
      delete fee_detail_url(@fee_detail)
    end

    assert_redirected_to fee_details_url
  end
end
