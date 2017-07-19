# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20170719184113) do

  create_table "manager_relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  add_index "manager_relationships", ["project_id"], name: "index_manager_relationships_on_project_id"
  add_index "manager_relationships", ["user_id"], name: "index_manager_relationships_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.date     "start_date"
    t.string   "name"
    t.string   "description"
    t.string   "string"
    t.integer  "volunteer_capacity"
    t.string   "location"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "hours_per_week"
    t.integer  "manager_id"
  end

  create_table "roles", force: :cascade do |t|
    t.integer "user_id"
    t.string  "name"
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true
  add_index "roles", ["user_id"], name: "index_roles_on_user_id"

  create_table "skills", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["user_id"], name: "index_skills_on_user_id"

  create_table "skills_users", id: false, force: :cascade do |t|
    t.integer "skill_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "education"
    t.string   "expertise"
    t.string   "description"
    t.string   "school"
    t.string   "availability"
    t.boolean  "complete",               default: false
    t.string   "phone"
    t.integer  "zip"
    t.string   "location"
    t.string   "lang1"
    t.string   "lang1_fluency"
    t.string   "lang2"
    t.string   "lang2_fluency"
    t.string   "time_commitment"
    t.string   "sunday_availability"
    t.string   "monday_availability"
    t.string   "tuesday_availability"
    t.string   "wednesday_availability"
    t.string   "thursday_availability"
    t.string   "friday_availability"
    t.string   "saturday_availability"
    t.string   "availability_comments"
    t.string   "certifications"
    t.string   "travel"
    t.boolean  "admin",                  default: false
    t.boolean  "manager",                default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "volunteer_relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  add_index "volunteer_relationships", ["project_id"], name: "index_volunteer_relationships_on_project_id"
  add_index "volunteer_relationships", ["user_id"], name: "index_volunteer_relationships_on_user_id"

end
