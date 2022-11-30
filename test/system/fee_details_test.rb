require "application_system_test_case"

class FeeDetailsTest < ApplicationSystemTestCase
  setup do
    @fee_detail = fee_details(:one)
  end

  test "visiting the index" do
    visit fee_details_url
    assert_selector "h1", text: "Fee Details"
  end

  test "creating a Fee detail" do
    visit fee_details_url
    click_on "New Fee Detail"

    fill_in "Month", with: @fee_detail.month
    fill_in "Status", with: @fee_detail.status
    fill_in "Student", with: @fee_detail.student_id
    fill_in "User", with: @fee_detail.user_id
    click_on "Create Fee detail"

    assert_text "Fee detail was successfully created"
    click_on "Back"
  end

  test "updating a Fee detail" do
    visit fee_details_url
    click_on "Edit", match: :first

    fill_in "Month", with: @fee_detail.month
    fill_in "Status", with: @fee_detail.status
    fill_in "Student", with: @fee_detail.student_id
    fill_in "User", with: @fee_detail.user_id
    click_on "Update Fee detail"

    assert_text "Fee detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Fee detail" do
    visit fee_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fee detail was successfully destroyed"
  end
end
