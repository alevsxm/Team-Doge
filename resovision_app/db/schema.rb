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

ActiveRecord::Schema.define(version: 20140801160615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educations", force: true do |t|
    t.string   "school_name"
    t.string   "degree"
    t.integer  "start_year"
    t.integer  "end_year"
    t.integer  "resovision_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", force: true do |t|
    t.string   "title"
    t.string   "summary"
    t.integer  "start_year"
    t.integer  "start_month"
    t.string   "is_current"
    t.string   "company_name"
    t.integer  "resovision_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resovisions", force: true do |t|
    t.string  "linkedin_id"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "headline"
    t.string  "location"
    t.string  "industry"
    t.integer "num_positions"
    t.integer "num_educations"
    t.text    "pic_url"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "linkedin_email"
    t.string   "linkedin_pw"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.string  "video_name"
    t.integer "resovision_id"
    t.integer "position_id"
    t.integer "education_id"
  end

end
