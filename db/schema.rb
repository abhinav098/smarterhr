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

ActiveRecord::Schema.define(version: 20170925064113) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accesses", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "url"
    t.integer  "kind"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.datetime "clockin"
    t.datetime "clockout"
    t.integer  "work"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_attendances_on_user_id", using: :btree
  end

  create_table "equipment", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "kind"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "issuances", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "issuable_type"
    t.integer  "issuable_id"
    t.integer  "state",         default: 0
    t.string   "description"
    t.integer  "issuer_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["issuable_type", "issuable_id"], name: "index_issuances_on_issuable_type_and_issuable_id", using: :btree
    t.index ["issuer_id"], name: "index_issuances_on_issuer_id", using: :btree
    t.index ["user_id"], name: "index_issuances_on_user_id", using: :btree
  end

  create_table "leaves", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "message"
    t.datetime "from_date"
    t.datetime "to_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "state",      default: 2
    t.integer  "kind",       default: 0
    t.index ["user_id"], name: "index_leaves_on_user_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "manager_id"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id"], name: "index_roles_on_employee_id", using: :btree
    t.index ["manager_id", "employee_id"], name: "index_roles_on_manager_id_and_employee_id", unique: true, using: :btree
    t.index ["manager_id"], name: "index_roles_on_manager_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "attendances", "users"
  add_foreign_key "issuances", "users"
  add_foreign_key "leaves", "users"
end
