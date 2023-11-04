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

ActiveRecord::Schema[7.0].define(version: 2021_05_11_030114) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "author", null: false
    t.string "description"
    t.string "publishing_company"
    t.string "edition"
    t.string "isbn"
    t.string "status"
    t.integer "pages_number"
    t.integer "edition_year"
    t.integer "exemplary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loans", force: :cascade do |t|
    t.date "loan_date", null: false
    t.date "devolution_date", null: false
    t.date "discharge_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "book_id"
    t.bigint "reader_id"
    t.index ["book_id"], name: "index_loans_on_book_id"
    t.index ["reader_id"], name: "index_loans_on_reader_id"
  end

  create_table "readers", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone"
    t.string "email"
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "loans", "books"
  add_foreign_key "loans", "readers"
end
