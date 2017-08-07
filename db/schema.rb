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

ActiveRecord::Schema.define(version: 20170806232321) do

  create_table "availabilities", force: :cascade do |t|
    t.boolean "monday_morning",      default: false, null: false
    t.boolean "monday_afternoon",    default: false, null: false
    t.boolean "monday_evening",      default: false, null: false
    t.boolean "tuesday_morning",     default: false, null: false
    t.boolean "tuesday_afternoon",   default: false, null: false
    t.boolean "tuesday_evening",     default: false, null: false
    t.boolean "wednesday_morning",   default: false, null: false
    t.boolean "wednesday_afternoon", default: false, null: false
    t.boolean "wednesday_evening",   default: false, null: false
    t.boolean "thursday_morning",    default: false, null: false
    t.boolean "thursday_afternoon",  default: false, null: false
    t.boolean "thursday_evening",    default: false, null: false
    t.boolean "friday_morning",      default: false, null: false
    t.boolean "friday_afternoon",    default: false, null: false
    t.boolean "friday_evening",      default: false, null: false
    t.boolean "saturday_morning",    default: false, null: false
    t.boolean "saturday_afternoon",  default: false, null: false
    t.boolean "saturday_evening",    default: false, null: false
    t.boolean "sunday_morning",      default: false, null: false
    t.boolean "sunday_afternoon",    default: false, null: false
    t.boolean "sunday_evening",      default: false, null: false
    t.integer "user_id"
  end

  create_table "certifications", force: :cascade do |t|
    t.string "name"
  end

  add_index "certifications", ["name"], name: "index_certifications_on_name", unique: true

  create_table "certifications_projects", id: false, force: :cascade do |t|
    t.integer "project_id",       null: false
    t.integer "certification_id", null: false
  end

  add_index "certifications_projects", ["certification_id"], name: "index_certifications_projects_on_certification_id"
  add_index "certifications_projects", ["project_id"], name: "index_certifications_projects_on_project_id"

  create_table "certifications_users", id: false, force: :cascade do |t|
    t.integer "user_id",          null: false
    t.integer "certification_id", null: false
  end

  add_index "certifications_users", ["certification_id"], name: "index_certifications_users_on_certification_id"
  add_index "certifications_users", ["user_id"], name: "index_certifications_users_on_user_id"

  create_table "construction_experiences", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "construction_experiences", ["name"], name: "index_construction_experiences_on_name", unique: true

  create_table "construction_experiences_projects", id: false, force: :cascade do |t|
    t.integer "construction_experience_id"
    t.integer "project_id"
  end

  create_table "construction_experiences_users", id: false, force: :cascade do |t|
    t.integer "construction_experience_id"
    t.integer "user_id"
  end

  create_table "design_experiences", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "design_experiences", ["name"], name: "index_design_experiences_on_name", unique: true

  create_table "design_experiences_projects", id: false, force: :cascade do |t|
    t.integer "design_experience_id"
    t.integer "project_id"
  end

  create_table "design_experiences_users", id: false, force: :cascade do |t|
    t.integer "design_experience_id"
    t.integer "user_id"
  end

  create_table "in_demands", force: :cascade do |t|
    t.integer "project_id"
    t.integer "table_id"
    t.string  "table_name"
  end

  add_index "in_demands", ["project_id"], name: "index_in_demands_on_project_id"
  add_index "in_demands", ["table_id"], name: "index_in_demands_on_table_id"

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
    t.integer  "users_id"
  end

  add_index "projects", ["users_id"], name: "index_projects_on_users_id"

  create_table "projects_skills", id: false, force: :cascade do |t|
    t.integer "skill_id"
    t.integer "project_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true

  create_table "skills", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["name"], name: "index_skills_on_name", unique: true
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
    t.boolean  "complete",               default: false
    t.string   "phone"
    t.integer  "zip"
    t.string   "location"
    t.string   "lang1"
    t.string   "lang1_fluency"
    t.string   "lang2"
    t.string   "lang2_fluency"
    t.string   "time_commitment"
    t.string   "availability_comments"
    t.string   "travel"
    t.boolean  "admin",                  default: false
    t.boolean  "manager",                default: false
    t.integer  "availability_id"
    t.integer  "role_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["role_id"], name: "index_users_on_role_id"

  create_table "volunteer_relationships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
  end

  add_index "volunteer_relationships", ["project_id"], name: "index_volunteer_relationships_on_project_id"
  add_index "volunteer_relationships", ["user_id"], name: "index_volunteer_relationships_on_user_id"

end
