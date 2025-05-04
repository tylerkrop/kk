# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_04_195051) do
  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.string "author", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "meeting_time", null: false
    t.string "reading_expectations", null: false
    t.integer "book_id", null: false
    t.index ["book_id"], name: "index_meetings_on_book_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "username", null: false
    t.string "remember_token"
    t.integer "role", default: 0, null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "position"
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_votes_on_book_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "meetings", "books"
  add_foreign_key "votes", "books"
  add_foreign_key "votes", "users"
end
