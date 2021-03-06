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

ActiveRecord::Schema.define(:version => 20150917122631) do

  create_table "can_haz_permissions", :force => true do |t|
    t.integer "csubject_id"
    t.string  "csubject_type"
    t.integer "cobject_id"
    t.string  "cobject_type"
    t.string  "permission_name"
  end

  add_index "can_haz_permissions", ["cobject_id"], :name => "object_id_ix"
  add_index "can_haz_permissions", ["csubject_id"], :name => "subject_id_ix"

  create_table "moviegoers", :force => true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "admin",      :default => false
  end

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.string   "rating"
    t.text     "description"
    t.datetime "release_date"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "reviews", :force => true do |t|
    t.integer "potatoes"
    t.text    "comments"
    t.integer "moviegoer_id"
    t.integer "movie_id"
  end

end
