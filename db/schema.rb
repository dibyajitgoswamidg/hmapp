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

ActiveRecord::Schema.define(version: 2019_04_25_174022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billing_entities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.integer "amount"
    t.bigint "billing_entity_id"
    t.bigint "patient_entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["billing_entity_id"], name: "index_bills_on_billing_entity_id"
    t.index ["patient_entry_id"], name: "index_bills_on_patient_entry_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "doctor_appointment_sheets", force: :cascade do |t|
    t.date "appointment_date"
    t.time "appointment_time"
    t.string "status"
    t.bigint "patient_entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_entry_id"], name: "index_doctor_appointment_sheets_on_patient_entry_id"
  end

  create_table "duty_entities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "duty_sheets", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.bigint "employee_id"
    t.bigint "ward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_duty_sheets_on_employee_id"
    t.index ["ward_id"], name: "index_duty_sheets_on_ward_id"
  end

  create_table "employee_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "contact_number"
    t.string "alternate_contact_number"
    t.string "email"
    t.string "address_line"
    t.string "city"
    t.string "country"
    t.string "pincode"
    t.bigint "employee_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.string "govt_id_type"
    t.string "govt_id"
    t.string "state"
    t.index ["employee_type_id"], name: "index_employees_on_employee_type_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.string "name"
    t.string "qty"
    t.date "start_date"
    t.date "end_date"
    t.string "routine"
    t.bigint "patient_entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_entry_id"], name: "index_medicines_on_patient_entry_id"
  end

  create_table "patient_entries", force: :cascade do |t|
    t.string "description"
    t.string "doctor"
    t.bigint "patient_registration_id"
    t.bigint "department_id"
    t.bigint "patient_registration_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_patient_entries_on_department_id"
    t.index ["patient_registration_id"], name: "index_patient_entries_on_patient_registration_id"
    t.index ["patient_registration_type_id"], name: "index_patient_entries_on_patient_registration_type_id"
  end

  create_table "patient_registration_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_registrations", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "contact_number"
    t.string "address_line"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pincode"
    t.string "email"
    t.string "govt_id_type"
    t.string "govt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_number"], name: "patient_registrations_contact_number_key", unique: true
    t.index ["email"], name: "patient_registrations_email_key", unique: true
  end

  create_table "test_reports", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "patient_entry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_entry_id"], name: "index_test_reports_on_patient_entry_id"
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

  create_table "ward_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wards", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.string "description"
    t.bigint "ward_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ward_type_id"], name: "index_wards_on_ward_type_id"
  end

end
