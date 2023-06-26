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

ActiveRecord::Schema[7.0].define(version: 2023_06_25_215632) do
  create_table "fights", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "status", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_fights_on_user_id"
  end

  create_table "likes", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id", "post_id"], name: "index_likes_on_user_id_and_post_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "post_tools", charset: "utf8", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "tool_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_tools_on_post_id"
    t.index ["tool_id"], name: "index_post_tools_on_tool_id"
  end

  create_table "posts", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.string "body", null: false
    t.string "thumbnail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_types", default: 0, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "profiles", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tool_id", null: false
    t.string "avatar"
    t.integer "house_age"
    t.integer "house_floor"
    t.integer "house_structure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tool_id"], name: "index_profiles_on_tool_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "supports", charset: "utf8", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "fight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fight_id"], name: "index_supports_on_fight_id"
    t.index ["user_id"], name: "index_supports_on_user_id"
  end

  create_table "tools", charset: "utf8", force: :cascade do |t|
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "fights", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "post_tools", "posts"
  add_foreign_key "post_tools", "tools"
  add_foreign_key "posts", "users"
  add_foreign_key "profiles", "tools"
  add_foreign_key "profiles", "users"
  add_foreign_key "supports", "fights"
  add_foreign_key "supports", "users"
end
