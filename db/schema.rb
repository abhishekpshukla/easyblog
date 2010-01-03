# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100103082039) do

  create_table "users", :primary_key => "username", :force => true do |t|
    t.string   "id",                :limit => 36,                    :null => false
    t.string   "email",             :limit => 64, :default => "",    :null => false
    t.string   "first_name",        :limit => 32
    t.string   "last_name",         :limit => 32
    t.string   "title",             :limit => 64
    t.string   "company",           :limit => 64
    t.string   "alt_email",         :limit => 64
    t.string   "phone",             :limit => 32
    t.string   "mobile",            :limit => 32
    t.string   "aim",               :limit => 32
    t.string   "yahoo",             :limit => 32
    t.string   "google",            :limit => 32
    t.string   "skype",             :limit => 32
    t.string   "password_hash",                   :default => "",    :null => false
    t.string   "password_salt",                   :default => "",    :null => false
    t.string   "remember_token",                  :default => "",    :null => false
    t.string   "perishable_token",                :default => "",    :null => false
    t.string   "openid_identifier"
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.integer  "login_count",                     :default => 0,     :null => false
    t.boolean  "voided",                          :default => false
    t.datetime "voided_at"
    t.string   "voided_by",         :limit => 36
    t.text     "voided_reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
