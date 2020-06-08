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

ActiveRecord::Schema.define(version: 2020_06_08_044828) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "scholastic_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scholastic_record_id"], name: "index_comments_on_scholastic_record_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "phone_number", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.boolean "is_active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true
  end

  create_table "entries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "requester_id"
    t.integer "company_id"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_entries_on_company_id"
    t.index ["requester_id"], name: "index_entries_on_requester_id"
    t.index ["room_id"], name: "index_entries_on_room_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "scholastic_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scholastic_record_id"], name: "index_likes_on_scholastic_record_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "mail"
    t.integer "user_id"
    t.integer "requester_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_id"
    t.index ["company_id"], name: "index_messages_on_company_id"
    t.index ["requester_id"], name: "index_messages_on_requester_id"
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.boolean "checked", default: false, null: false
    t.integer "user_id"
    t.integer "requester_id"
    t.integer "company_id"
    t.integer "scholastic_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "comment_id"
    t.integer "visitor_id"
    t.integer "visited_id"
    t.string "action", default: "", null: false
    t.integer "order_id"
    t.integer "offer_id"
    t.integer "requester_visitor_id"
    t.integer "requester_visited_id"
    t.integer "company_visitor_id"
    t.integer "company_visited_id"
    t.integer "message_id"
    t.integer "room_id"
    t.index ["comment_id"], name: "index_notifications_on_comment_id"
    t.index ["company_id"], name: "index_notifications_on_company_id"
    t.index ["company_visited_id"], name: "index_notifications_on_company_visited_id"
    t.index ["company_visitor_id"], name: "index_notifications_on_company_visitor_id"
    t.index ["message_id"], name: "index_notifications_on_message_id"
    t.index ["offer_id"], name: "index_notifications_on_offer_id"
    t.index ["order_id"], name: "index_notifications_on_order_id"
    t.index ["requester_id"], name: "index_notifications_on_requester_id"
    t.index ["requester_visited_id"], name: "index_notifications_on_requester_visited_id"
    t.index ["requester_visitor_id"], name: "index_notifications_on_requester_visitor_id"
    t.index ["room_id"], name: "index_notifications_on_room_id"
    t.index ["scholastic_record_id"], name: "index_notifications_on_scholastic_record_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "offer_applications", force: :cascade do |t|
    t.integer "user_id"
    t.integer "offer_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "offer_application_status", default: 0, null: false
    t.index ["company_id"], name: "index_offer_applications_on_company_id"
    t.index ["offer_id"], name: "index_offer_applications_on_offer_id"
    t.index ["user_id"], name: "index_offer_applications_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "industry", null: false
    t.string "occupation", null: false
    t.string "work_location", null: false
    t.text "appeal_point", null: false
    t.text "job_description", null: false
    t.string "employment_status", null: false
    t.integer "working_hour", null: false
    t.integer "salary", null: false
    t.text "application_condition", null: false
    t.text "vacation", null: false
    t.text "welfare", null: false
    t.boolean "is_active", default: true, null: false
    t.string "image_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_offers_on_company_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "request_content", null: false
    t.text "request_detail", null: false
    t.integer "cost", null: false
    t.integer "progress_status", default: 0, null: false
    t.integer "user_id"
    t.integer "requester_id"
    t.integer "order_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requester_id"], name: "index_orders_on_requester_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "problem_solutions", force: :cascade do |t|
    t.text "worked"
    t.text "not_worked"
    t.text "solution"
    t.text "improvement_point"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_problem_solutions_on_user_id"
  end

  create_table "requesters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "business_name", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_requesters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_requesters_on_reset_password_token", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.string "theme"
    t.text "completion"
    t.text "halfway"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "entry_id"
    t.integer "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "requester_id"
    t.integer "company_id"
    t.index ["company_id"], name: "index_rooms_on_company_id"
    t.index ["entry_id"], name: "index_rooms_on_entry_id"
    t.index ["message_id"], name: "index_rooms_on_message_id"
    t.index ["requester_id"], name: "index_rooms_on_requester_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "scholastic_records", force: :cascade do |t|
    t.integer "learning_time"
    t.integer "learning_time_min"
    t.integer "user_id"
    t.string "learning_content"
    t.text "learning_detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.float "total_time"
    t.date "created_date"
    t.index ["category_id"], name: "index_scholastic_records_on_category_id"
    t.index ["user_id"], name: "index_scholastic_records_on_user_id"
  end

  create_table "setting_goals", force: :cascade do |t|
    t.string "target"
    t.text "concern"
    t.text "commitment"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_setting_goals_on_user_id"
  end

  create_table "strengths", force: :cascade do |t|
    t.text "skill"
    t.text "appeal_point"
    t.text "expection"
    t.text "portfolio"
    t.boolean "is_active", default: false, null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_strengths_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.date "deadline"
    t.boolean "progress_status", default: true, null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "user_name", null: false
    t.integer "grade", null: false
    t.string "other_grade"
    t.string "phone_number", null: false
    t.string "image_id"
    t.boolean "learning_status", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "offer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["offer_id"], name: "index_users_on_offer_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
