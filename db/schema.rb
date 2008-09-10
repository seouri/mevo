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

ActiveRecord::Schema.define(:version => 20080908074250) do

  create_table "books", :force => true do |t|
    t.string   "title",            :limit => 9
    t.integer  "terms_count",                   :default => 0
    t.integer  "line_items_count",              :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "books", ["title"], :name => "index_books_on_title"

  create_table "line_items", :force => true do |t|
    t.integer  "book_id"
    t.integer  "term_id"
    t.integer  "page",       :limit => 2
    t.integer  "indent",     :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["book_id", "page"], :name => "index_line_items_on_book_id_and_page"
  add_index "line_items", ["term_id", "book_id"], :name => "index_line_items_on_term_id_and_book_id"

  create_table "terms", :force => true do |t|
    t.string "term"
  end

  add_index "terms", ["term"], :name => "index_terms_on_term"

end
