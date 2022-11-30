json.extract! fee_detail, :id, :user_id, :student_id, :month, :status, :created_at, :updated_at
json.url fee_detail_url(fee_detail, format: :json)
