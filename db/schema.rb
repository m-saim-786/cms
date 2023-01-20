# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_221_206_230_908) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cash_entries', force: :cascade do |t|
    t.integer 'amount', null: false
    t.text 'description', null: false
    t.bigint 'user_id'
    t.integer 'entry_type', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.date 'date', default: -> { 'CURRENT_DATE' }
    t.index ['user_id'], name: 'index_cash_entries_on_user_id'
  end

  create_table 'fee_details', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'student_id'
    t.date 'submitted_at'
    t.integer 'status'
    t.integer 'amount'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['student_id'], name: 'index_fee_details_on_student_id'
    t.index ['user_id'], name: 'index_fee_details_on_user_id'
  end

  create_table 'fee_records', force: :cascade do |t|
    t.bigint 'student_id'
    t.date 'submited_on'
    t.date 'month_of'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['student_id'], name: 'index_fee_records_on_student_id'
  end

  create_table 'grades', force: :cascade do |t|
    t.string 'name'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_grades_on_user_id'
  end

  create_table 'marks', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'subject_id'
    t.integer 'total_marks'
    t.integer 'obtain_marks'
    t.bigint 'result_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['result_id'], name: 'index_marks_on_result_id'
    t.index ['subject_id'], name: 'index_marks_on_subject_id'
    t.index ['user_id'], name: 'index_marks_on_user_id'
  end

  create_table 'result_types', force: :cascade do |t|
    t.string 'title'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_result_types_on_user_id'
  end

  create_table 'results', force: :cascade do |t|
    t.date 'month'
    t.bigint 'user_id'
    t.bigint 'student_id'
    t.bigint 'grade_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'result_type_id'
    t.index ['grade_id'], name: 'index_results_on_grade_id'
    t.index ['result_type_id'], name: 'index_results_on_result_type_id'
    t.index ['student_id'], name: 'index_results_on_student_id'
    t.index ['user_id'], name: 'index_results_on_user_id'
  end

  create_table 'students', force: :cascade do |t|
    t.string 'name'
    t.integer 'roll_no'
    t.string 'Bform'
    t.string 'contact'
    t.date 'age'
    t.string 'father_name'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'fee_amount', null: false
    t.bigint 'grade_id'
    t.index ['grade_id'], name: 'index_students_on_grade_id'
    t.index ['user_id'], name: 'index_students_on_user_id'
  end

  create_table 'subjects', force: :cascade do |t|
    t.string 'name'
    t.bigint 'grade_id'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['grade_id'], name: 'index_subjects_on_grade_id'
    t.index ['user_id'], name: 'index_subjects_on_user_id'
  end

  create_table 'teachers', force: :cascade do |t|
    t.string 'name'
    t.string 'contact'
    t.string 'qualification'
    t.string 'bloog_group'
    t.integer 'pay'
    t.integer 'salary_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'cash_entries', 'users'
  add_foreign_key 'fee_details', 'students'
  add_foreign_key 'fee_details', 'users'
  add_foreign_key 'grades', 'users'
  add_foreign_key 'marks', 'results'
  add_foreign_key 'marks', 'subjects'
  add_foreign_key 'marks', 'users'
  add_foreign_key 'result_types', 'users'
  add_foreign_key 'results', 'grades'
  add_foreign_key 'results', 'result_types'
  add_foreign_key 'results', 'students'
  add_foreign_key 'results', 'users'
  add_foreign_key 'students', 'grades'
  add_foreign_key 'students', 'users'
  add_foreign_key 'subjects', 'grades'
  add_foreign_key 'subjects', 'users'
end
