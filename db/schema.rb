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

ActiveRecord::Schema.define(version: 20141205113954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidatures", force: true do |t|
    t.string   "sequencial_candidato"
    t.integer  "election_year"
    t.string   "election_description"
    t.string   "federative_unit_symbol"
    t.string   "federative_unit_description"
    t.string   "job_title"
    t.string   "candidate_number"
    t.string   "political_party_symbol"
    t.string   "political_caption"
    t.string   "desc_sit_tot_turno"
    t.integer  "representative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          null: false
    t.integer  "proposal_id",      null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["proposal_id"], name: "index_comments_on_proposal_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "expenditures", force: true do |t|
    t.string   "sequencial_candidato"
    t.string   "seller"
    t.decimal  "price",                precision: 10, scale: 2
    t.string   "description"
    t.integer  "candidature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patrimonies", force: true do |t|
    t.string   "sequencial_candidato"
    t.string   "description"
    t.integer  "candidature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price"
  end

  add_index "patrimonies", ["candidature_id"], name: "index_patrimonies_on_candidature_id", using: :btree

  create_table "proposals", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "representative_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "representatives", force: true do |t|
    t.string   "name"
    t.string   "occupation"
    t.string   "gender"
    t.string   "voter_registration"
    t.string   "mcn_id"
    t.string   "type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "revenues", force: true do |t|
    t.string   "sequencial_candidato"
    t.string   "receipt_title"
    t.string   "donator"
    t.string   "description"
    t.integer  "candidature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
