# frozen_string_literal: true

json.array! @cash_entries, partial: 'cash_entries/cash_entry', as: :cash_entry
