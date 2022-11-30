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

ActiveRecord::Schema.define(version: 2022_05_14_131445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cash_entries", force: :cascade do |t|
    t.integer "amount", null: false
    t.text "description", null: false
    t.bigint "user_id"
    t.integer "entry_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date", default: -> { "CURRENT_DATE" }
    t.index ["user_id"], name: "index_cash_entries_on_user_id"
  end

  create_table "fee_details", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "student_id"
    t.date "submitted_at"
    t.integer "status"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_fee_details_on_student_id"
    t.index ["user_id"], name: "index_fee_details_on_user_id"
  end

  create_table "grades", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_grades_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.integer "roll_no"
    t.string "Bform"
    t.string "contact"
    t.date "age"
    t.string "father_name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fee_amount", null: false
    t.bigint "grade_id"
    t.index ["grade_id"], name: "index_students_on_grade_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cash_entries", "users"
  add_foreign_key "fee_details", "students"
  add_foreign_key "fee_details", "users"
  add_foreign_key "grades", "users"
  add_foreign_key "students", "grades"
  add_foreign_key "students", "users"
end
