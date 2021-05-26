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

ActiveRecord::Schema.define(version: 2021_05_26_173417) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "shuttle_seats", force: :cascade do |t|
    t.integer "seat_no"
    t.bigint "shuttle_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shuttle_id"], name: "index_shuttle_seats_on_shuttle_id"
  end

  create_table "shuttles", force: :cascade do |t|
    t.string "registration_no", default: "", null: false
    t.integer "passenger_limit", default: 0, null: false
    t.integer "totel_seats", default: 0, null: false
    t.integer "payment_per_passenger", default: 0, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_shuttle_seats", force: :cascade do |t|
    t.integer "seat_no"
    t.string "state"
    t.bigint "shuttle_id"
    t.bigint "user_id"
    t.bigint "user_shuttle_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shuttle_id"], name: "index_user_shuttle_seats_on_shuttle_id"
    t.index ["user_id"], name: "index_user_shuttle_seats_on_user_id"
    t.index ["user_shuttle_id"], name: "index_user_shuttle_seats_on_user_shuttle_id"
  end

  create_table "user_shuttles", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "ends_at"
    t.integer "no_of_seats"
    t.string "state"
    t.string "user_payment_status"
    t.integer "user_payment"
    t.bigint "user_id"
    t.bigint "shuttle_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shuttle_id"], name: "index_user_shuttles_on_shuttle_id"
    t.index ["user_id"], name: "index_user_shuttles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
