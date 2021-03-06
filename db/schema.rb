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

ActiveRecord::Schema.define(:version => 20110323142800) do

  create_table "accounts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "page_url"
    t.string   "token"
    t.datetime "token_expires_at"
    t.datetime "confirmed_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "accounts", ["confirmed_at"], :name => "index_accounts_on_confirmed_at"
  add_index "accounts", ["created_at"], :name => "index_accounts_on_created_at"
  add_index "accounts", ["email"], :name => "index_accounts_on_email"
  add_index "accounts", ["first_name"], :name => "index_accounts_on_first_name"
  add_index "accounts", ["last_name"], :name => "index_accounts_on_last_name"
  add_index "accounts", ["token"], :name => "index_accounts_on_token"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorizations", :force => true do |t|
    t.integer "account_id",  :null => false
    t.integer "category_id", :null => false
  end

  add_index "categorizations", ["account_id", "category_id"], :name => "index_categorizations_on_account_id_and_category_id", :unique => true

end
