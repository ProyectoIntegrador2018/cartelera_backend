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

ActiveRecord::Schema.define(version: 20181111051039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "enabled",    default: true, null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "applicant_id",                                                                                        null: false
    t.integer  "sponsor_id",                                                                                          null: false
    t.string   "review_status",            default: "",                                                               null: false
    t.string   "name",                     default: "",                                                               null: false
    t.string   "description"
    t.string   "location",                 default: ""
    t.string   "campus",                   default: "MTY",                                                            null: false
    t.integer  "category_id",                                                                                         null: false
    t.string   "photo",                    default: "http://gda.itesm.mx/zonaei/content/bqsbCK0XJW/logo-iag_LCB.png"
    t.decimal  "cost",                     default: "0.0"
    t.boolean  "public_event",             default: true,                                                             null: false
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.string   "requirements_to_register", default: ""
    t.string   "registration_url",         default: ""
    t.datetime "registration_deadline"
    t.string   "schedule",                 default: ""
    t.string   "facebook_url",             default: ""
    t.string   "twitter_url",              default: ""
    t.string   "contact_phone",            default: ""
    t.string   "contact_name",             default: ""
    t.string   "contact_email",            default: ""
    t.datetime "created_at",                                                                                          null: false
    t.datetime "updated_at",                                                                                          null: false
    t.boolean  "published",                default: true
    t.boolean  "cancelled",                default: false
    t.text     "cancel_message",           default: ""
    t.string   "languages",                default: [],                                                                            array: true
    t.string   "prefix",                   default: ""
    t.boolean  "has_registration",         default: true
    t.boolean  "pet_friendly",             default: false
    t.string   "majors",                   default: [],                                                                            array: true
    t.boolean  "has_deadline",             default: true
    t.text     "registration_message",     default: ""
    t.string   "tag_names",                default: [],                                                                            array: true
    t.integer  "max_capacity",             default: 0
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "state"
    t.string   "category_name"
    t.text     "review_comments",          default: "false"
    t.integer  "sponsor_reviewer",         default: 0
    t.string   "status_type",              default: "sponsor_review"
    t.index ["applicant_id"], name: "index_events_on_applicant_id", using: :btree
    t.index ["sponsor_id"], name: "index_events_on_sponsor_id", using: :btree
  end

  create_table "registrees", force: :cascade do |t|
    t.string   "email",                   null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "full_name",  default: ""
    t.integer  "event_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "is_newbie",              default: true
    t.string   "first_name"
    t.string   "last_name"
    t.string   "office"
    t.string   "phone_number"
    t.string   "campus"
    t.integer  "user_type",              default: 1
    t.boolean  "enabled",                default: true, null: false
    t.integer  "sponsored_by",           default: 0
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
