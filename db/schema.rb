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

ActiveRecord::Schema.define(version: 20_171_201_165_132) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'areas', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'assessment_answers', force: :cascade do |t|
    t.integer 'assessment_id'
    t.integer 'skill_id'
    t.integer 'attitude_id'
    t.string 'answer_type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'assessments', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'aasm_state'
    t.integer 'user_id'
  end

  create_table 'attitudes', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'body'
    t.text 'formatted_body'
    t.string 'commentable_type'
    t.bigint 'commentable_id'
    t.string 'user_type'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[commentable_type commentable_id], name: 'index_comments_on_commentable_type_and_commentable_id'
    t.index %w[user_type user_id], name: 'index_comments_on_user_type_and_user_id'
  end

  create_table 'feed_items', force: :cascade do |t|
    t.text 'description'
    t.string 'item_type'
    t.bigint 'item_id'
    t.bigint 'young_person_id', null: false
    t.string 'created_by_type'
    t.bigint 'created_by_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'comments_count', default: 0
    t.index %w[created_by_type created_by_id], name: 'index_feed_items_on_created_by_type_and_created_by_id'
    t.index %w[item_type item_id], name: 'index_feed_items_on_item_type_and_item_id'
    t.index ['young_person_id'], name: 'index_feed_items_on_young_person_id'
  end

  create_table 'file_uploads', force: :cascade do |t|
    t.string 'attachment_file_name', null: false
    t.integer 'attachment_file_size', null: false
    t.string 'attachment_content_type', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'practitioners', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'avatar_file_name'
    t.string 'avatar_content_type'
    t.integer 'avatar_file_size'
    t.datetime 'avatar_updated_at'
    t.string 'work_number'
    t.string 'duty_number'
  end

  create_table 'skills', force: :cascade do |t|
    t.string 'name'
    t.text 'description'
    t.integer 'area_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'solutions', force: :cascade do |t|
    t.string 'embedded_video_url'
    t.string 'website'
    t.text 'title'
    t.text 'description'
    t.text 'business_opportunities'
    t.text 'implementation_impact'
    t.text 'skills_experience'
    t.bigint 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'hero_image_file_name'
    t.string 'hero_image_content_type'
    t.integer 'hero_image_file_size'
    t.datetime 'hero_image_updated_at'
    t.index ['user_id'], name: 'index_solutions_on_user_id'
  end

  create_table 'tasks', force: :cascade do |t|
    t.string 'summary'
    t.text 'description'
    t.date 'due_date'
    t.integer 'status', default: 1
    t.boolean 'practitioner_task', default: false
    t.bigint 'practitioner_id'
    t.bigint 'young_person_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['practitioner_id'], name: 'index_tasks_on_practitioner_id'
    t.index ['young_person_id'], name: 'index_tasks_on_young_person_id'
  end

  create_table 'user_logins', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'provider'
    t.string 'uid'
    t.string 'user_type'
    t.bigint 'user_id'
    t.index ['email'], name: 'index_user_logins_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_user_logins_on_reset_password_token', unique: true
    t.index %w[user_type user_id], name: 'index_user_logins_on_user_type_and_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.boolean 'admin', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'first_name'
    t.string 'last_name'
    t.string 'organisation'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'web_contents', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.string 'url'
    t.string 'image_url'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'young_people', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.date 'date_of_birth'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'practitioner_id'
    t.index ['practitioner_id'], name: 'index_young_people_on_practitioner_id'
  end
end
