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

ActiveRecord::Schema.define(version: 20131012232835) do

  create_table "ads", force: true do |t|
    t.string   "type"
    t.string   "keywords"
    t.string   "text"
    t.integer  "initiative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ads", ["initiative_id"], name: "index_ads_on_initiative_id", using: :btree
  add_index "ads", ["type"], name: "index_ads_on_type", using: :btree

  create_table "initiative_stats", force: true do |t|
    t.integer  "signs_count"
    t.integer  "donations_count"
    t.integer  "donations_amount"
    t.integer  "conversions_count"
    t.integer  "initiative_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "initiative_stats", ["initiative_id"], name: "index_initiative_stats_on_initiative_id", using: :btree

  create_table "initiatives", force: true do |t|
    t.string   "title",            null: false
    t.text     "description",      null: false
    t.string   "hashtag"
    t.boolean  "signs_active"
    t.boolean  "donations_active"
    t.integer  "ong_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "initiatives", ["ong_id"], name: "index_initiatives_on_ong_id", using: :btree
  add_index "initiatives", ["title"], name: "index_initiatives_on_title", using: :btree

  create_table "ongs", force: true do |t|
    t.string   "name",                    null: false
    t.text     "mission"
    t.text     "vission"
    t.string   "webpage",    limit: 2000
    t.string   "address"
    t.string   "twitter"
    t.string   "facebook"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "subdomain"
  end

  add_index "ongs", ["facebook"], name: "index_ongs_on_facebook", unique: true, using: :btree
  add_index "ongs", ["name"], name: "index_ongs_on_name", unique: true, using: :btree
  add_index "ongs", ["twitter"], name: "index_ongs_on_twitter", unique: true, using: :btree

  create_table "related_links", force: true do |t|
    t.text     "description"
    t.string   "url",           limit: 2000, null: false
    t.integer  "initiative_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "related_links", ["initiative_id"], name: "index_related_links_on_initiative_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.string   "symbol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["symbol"], name: "index_roles_on_symbol", unique: true, using: :btree

  create_table "signs", force: true do |t|
    t.string   "first_name",    null: false
    t.string   "last_name",     null: false
    t.string   "email",         null: false
    t.string   "identifier",    null: false
    t.boolean  "validated"
    t.integer  "initiative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "signs", ["email"], name: "index_signs_on_email", using: :btree
  add_index "signs", ["identifier"], name: "index_signs_on_identifier", using: :btree
  add_index "signs", ["initiative_id"], name: "index_signs_on_initiative_id", using: :btree
  add_index "signs", ["validated"], name: "index_signs_on_validated", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
