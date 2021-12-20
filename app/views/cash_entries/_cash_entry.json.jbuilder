json.extract! cash_entry, :id, :amount, :description, :user_id, :type, :created_at, :updated_at
json.url cash_entry_url(cash_entry, format: :json)
