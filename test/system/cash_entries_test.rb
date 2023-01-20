# frozen_string_literal: true

require 'application_system_test_case'

class CashEntriesTest < ApplicationSystemTestCase
  setup do
    @cash_entry = cash_entries(:one)
  end

  test 'visiting the index' do
    visit cash_entries_url
    assert_selector 'h1', text: 'Cash Entries'
  end

  test 'creating a Cash entry' do
    visit cash_entries_url
    click_on 'New Cash Entry'

    fill_in 'Amount', with: @cash_entry.amount
    fill_in 'Description', with: @cash_entry.description
    fill_in 'Type', with: @cash_entry.type
    fill_in 'User', with: @cash_entry.user_id
    click_on 'Create Cash entry'

    assert_text 'Cash entry was successfully created'
    click_on 'Back'
  end

  test 'updating a Cash entry' do
    visit cash_entries_url
    click_on 'Edit', match: :first

    fill_in 'Amount', with: @cash_entry.amount
    fill_in 'Description', with: @cash_entry.description
    fill_in 'Type', with: @cash_entry.type
    fill_in 'User', with: @cash_entry.user_id
    click_on 'Update Cash entry'

    assert_text 'Cash entry was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Cash entry' do
    visit cash_entries_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Cash entry was successfully destroyed'
  end
end
