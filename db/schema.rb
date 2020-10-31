# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_31_080349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "assignements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["list_id"], name: "index_assignements_on_list_id"
    t.index ["user_id"], name: "index_assignements_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "linkedin_url"
  end

  create_table "diplomas", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ghosts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.boolean "notification_send", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parsings", force: :cascade do |t|
    t.boolean "on_sheet", default: false
    t.boolean "parse", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_parsings_on_user_id"
  end

  create_table "popup_messages", force: :cascade do |t|
    t.text "message"
    t.string "link"
    t.string "link_title"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_popup_messages_on_user_id"
  end

  create_table "recruitments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_recruitments_on_company_id"
    t.index ["user_id"], name: "index_recruitments_on_user_id"
  end

  create_table "school_experiences", force: :cascade do |t|
    t.string "title"
    t.string "start_time"
    t.string "end_time"
    t.string "location"
    t.boolean "current", default: false
    t.bigint "user_id", null: false
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_school_experiences_on_school_id"
    t.index ["user_id"], name: "index_school_experiences_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "linkedin_url"
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "diploma_id", null: false
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["diploma_id"], name: "index_tags_on_diploma_id"
    t.index ["user_id"], name: "index_tags_on_user_id"
  end

  create_table "user_sectors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "sector_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sector_id"], name: "index_user_sectors_on_sector_id"
    t.index ["user_id"], name: "index_user_sectors_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "linkedin_url"
    t.string "whatsapp_number"
    t.boolean "looking_for_job"
    t.boolean "looking_for_internship"
    t.boolean "company_hire"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin"
    t.boolean "parsing", default: false
    t.boolean "automatic_updating", default: false
    t.boolean "manual_updating", default: true
    t.boolean "on_google_sheet", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  create_table "work_experiences", force: :cascade do |t|
    t.string "title"
    t.string "start_time"
    t.string "end_time"
    t.string "location"
    t.boolean "current", default: false
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_work_experiences_on_company_id"
    t.index ["user_id"], name: "index_work_experiences_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "assignements", "lists"
  add_foreign_key "assignements", "users"
  add_foreign_key "parsings", "users"
  add_foreign_key "popup_messages", "users"
  add_foreign_key "recruitments", "companies"
  add_foreign_key "recruitments", "users"
  add_foreign_key "school_experiences", "schools"
  add_foreign_key "school_experiences", "users"
  add_foreign_key "tags", "diplomas"
  add_foreign_key "tags", "users"
  add_foreign_key "user_sectors", "sectors"
  add_foreign_key "user_sectors", "users"
  add_foreign_key "visits", "users"
  add_foreign_key "work_experiences", "companies"
  add_foreign_key "work_experiences", "users"
end
