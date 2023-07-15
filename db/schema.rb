# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_15_193636) do
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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "balances", force: :cascade do |t|
    t.integer "total", default: 0
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_balances_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name_company"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "expense_types", force: :cascade do |t|
    t.string "expense_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_expense_types_on_company_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "item_name"
    t.date "date"
    t.text "description"
    t.float "amount", default: 0.0
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "expense_type_id", null: false
    t.index ["company_id"], name: "index_expenses_on_company_id"
    t.index ["expense_type_id"], name: "index_expenses_on_expense_type_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.string "item_name"
    t.date "date"
    t.text "description"
    t.float "amount", default: 0.0
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_incomes_on_company_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "subscription_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subscription_type"
    t.bigint "user_id"
    t.integer "credit_card_number"
    t.string "name"
    t.integer "security_code"
    t.string "expiration_date"
    t.index ["subscription_id"], name: "index_payments_on_subscription_id"
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.date "init_date"
    t.date "end_date"
    t.float "price_sub", default: 0.0
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subscription_type", default: "trial"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "balances", "companies"
  add_foreign_key "companies", "users"
  add_foreign_key "expenses", "companies"
  add_foreign_key "expenses", "expense_types"
  add_foreign_key "incomes", "companies"
  add_foreign_key "payments", "subscriptions"
  add_foreign_key "payments", "users"
  add_foreign_key "subscriptions", "users"
end
