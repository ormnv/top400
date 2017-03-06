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

ActiveRecord::Schema.define(version: 20170227033200) do

  create_table "djs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_djs_on_name", unique: true, using: :btree
  end

  create_table "show_songs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "dj_id"
    t.integer  "show_id"
    t.integer  "song_id"
    t.integer  "track_order"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["dj_id", "show_id", "song_id", "track_order"], name: "show_songs_index", unique: true, using: :btree
  end

  create_table "shows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.date     "date"
    t.string   "tracklist"
    t.string   "link_to_soundcloud"
    t.string   "link_to_newtown_radio"
    t.text     "description",           limit: 65535
    t.boolean  "is_standalone",                       default: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "flyer_file_name"
    t.string   "flyer_content_type"
    t.integer  "flyer_file_size"
    t.datetime "flyer_updated_at"
    t.index ["date", "link_to_newtown_radio"], name: "index_shows_on_date_and_link_to_newtown_radio", unique: true, using: :btree
  end

  create_table "songs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "artist"
    t.string   "title"
    t.string   "album"
    t.decimal  "bpm",        precision: 10
    t.string   "key"
    t.integer  "play_count",                default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["artist", "title", "album", "bpm", "key"], name: "index_songs_on_artist_and_title_and_album_and_bpm_and_key", unique: true, using: :btree
  end

  create_table "standalone_tracklists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.date     "date"
    t.string   "tracklist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date", "title"], name: "index_standalone_tracklists_on_date_and_title", unique: true, using: :btree
  end

end
