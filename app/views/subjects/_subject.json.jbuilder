# frozen_string_literal: true

json.extract! subject, :id, :name, :grade_id, :user_id, :created_at, :updated_at
json.url subject_url(subject, format: :json)
