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

ActiveRecord::Schema.define(:version => 20120209102039) do

  create_table "data_factories", :force => true do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "data_factories_slide_templates", :id => false, :force => true do |t|
    t.integer "data_factory_id"
    t.integer "slide_template_id"
  end

  add_index "data_factories_slide_templates", ["data_factory_id"], :name => "index_data_factories_slide_templates_on_data_factory_id"
  add_index "data_factories_slide_templates", ["slide_template_id"], :name => "index_data_factories_slide_templates_on_slide_template_id"

  create_table "evms", :force => true do |t|
    t.integer  "revision"
    t.date     "measured_date"
    t.float    "pv"
    t.integer  "bac"
    t.integer  "sac"
    t.float    "ev"
    t.float    "ac"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "evms", ["user_id"], :name => "index_evms_on_user_id"

  create_table "presentation_templates", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "presentations", :force => true do |t|
    t.date     "create_date"
    t.string   "project_type"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_links", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_links", ["user_id"], :name => "index_product_links_on_user_id"

  create_table "risk_items", :force => true do |t|
    t.integer  "risk_number"
    t.string   "event"
    t.string   "effect"
    t.string   "preventive_measure"
    t.string   "counter_measure"
    t.integer  "risk_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "risk_items", ["risk_id"], :name => "index_risk_items_on_risk_id"

  create_table "risk_scores", :force => true do |t|
    t.date     "measured_date"
    t.float    "generation_rate"
    t.float    "influence_rate"
    t.integer  "risk_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "risk_scores", ["risk_item_id"], :name => "index_risk_scores_on_risk_item_id"

  create_table "risks", :force => true do |t|
    t.float    "torelance"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "risks", ["user_id"], :name => "index_risks_on_user_id"

  create_table "slide_data", :force => true do |t|
    t.text     "data"
    t.text     "measured_date"
    t.string   "type"
    t.integer  "slide_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slide_data", ["slide_id"], :name => "index_slide_data_on_slide_id"

  create_table "slide_templates", :force => true do |t|
    t.string   "name"
    t.integer  "presentation_template_id"
    t.integer  "figure_number"
    t.integer  "page"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slide_templates", ["presentation_template_id"], :name => "index_slide_templates_on_presentation_template_id"

  create_table "slides", :force => true do |t|
    t.string   "comment"
    t.integer  "page"
    t.integer  "user_id"
    t.integer  "presentation_id"
    t.integer  "slide_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "slides", ["presentation_id"], :name => "index_slides_on_presentation_id"
  add_index "slides", ["slide_template_id"], :name => "index_slides_on_slide_template_id"
  add_index "slides", ["user_id"], :name => "index_slides_on_user_id"

  create_table "submit_limit_timers", :force => true do |t|
    t.string   "limit_weekday_start"
    t.string   "limit_weekday_end"
    t.integer  "limit_time_start"
    t.integer  "limit_time_end"
    t.string   "dead_line_weekday"
    t.string   "project_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "type"
    t.string   "team_name"
    t.string   "project_name"
    t.string   "project_type"
    t.string   "project_state"
    t.integer  "year"
    t.date     "project_start_date"
    t.date     "project_completion_date"
    t.date     "project_stats_start_date"
    t.boolean  "login_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
