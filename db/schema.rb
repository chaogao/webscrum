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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130115093432) do

  create_table "features", :force => true do |t|
    t.string   "name",                       :null => false
    t.text     "description"
    t.integer  "progress",    :default => 0
    t.integer  "plane_days",                 :null => false
    t.integer  "use_days",    :default => 0
    t.integer  "user_id",                    :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "year_week",                  :null => false
    t.integer  "group_id"
    t.date     "start"
    t.date     "end"
    t.integer  "times"
    t.integer  "from"
    t.integer  "to"
    t.string   "goal"
    t.integer  "ftype_id",                   :null => false
  end

  create_table "ftypes", :force => true do |t|
    t.string   "name",                       :null => false
    t.integer  "catalog",     :default => 0
    t.integer  "user_id"
    t.integer  "show",        :default => 0
    t.text     "description"
    t.text     "ruler"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "contact"
    t.string   "head_img"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "creator_id",  :null => false
  end

  create_table "reports", :force => true do |t|
    t.string   "title",        :null => false
    t.text     "content"
    t.integer  "user_id",      :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.date     "created_date", :null => false
    t.integer  "group_id"
  end

  create_table "reports_features", :force => true do |t|
    t.integer  "feature_id",                        :null => false
    t.integer  "report_id",                         :null => false
    t.string   "description"
    t.integer  "progress_increment", :default => 0
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "rulers", :force => true do |t|
    t.string   "title",                         :null => false
    t.string   "name",                          :null => false
    t.string   "default"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "ftype_id",                      :null => false
    t.boolean  "hide",       :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "auth",            :default => 0
    t.string   "email"
    t.string   "head_img"
    t.text     "description"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "hashed_password"
    t.string   "salt",                           :null => false
  end

  create_table "users_groups", :force => true do |t|
    t.integer  "user_id",                   :null => false
    t.integer  "group_id",                  :null => false
    t.integer  "auth",       :default => 0
    t.datetime "join_time"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end
