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

ActiveRecord::Schema.define(version: 20180124003643) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_states", force: :cascade do |t|
    t.integer "state", default: 0
  end

  create_table "solutions", force: :cascade do |t|
    t.string "embedded_video_url"
    t.string "website"
    t.text "title"
    t.text "description"
    t.text "business_opportunities"
    t.text "implementation_impact"
    t.text "skills_experience"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hero_image_file_name"
    t.string "hero_image_content_type"
    t.integer "hero_image_file_size"
    t.datetime "hero_image_updated_at"
    t.datetime "deleted_at"
    t.boolean "winner", default: false
    t.boolean "terms_accepted", default: false
    t.index ["deleted_at"], name: "index_solutions_on_deleted_at"
    t.index ["user_id"], name: "index_solutions_on_user_id"
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
    t.string "unconfirmed_email"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "organisation"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
