# frozen_string_literal: true

json.extract! result_type, :id, :title, :user_id, :created_at, :updated_at
json.url result_type_url(result_type, format: :json)
