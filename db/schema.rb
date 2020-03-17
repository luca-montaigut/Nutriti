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

ActiveRecord::Schema.define(version: 2020_03_17_102317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.integer "alim_code"
    t.string "alim_name"
    t.string "alim_group"
    t.string "alim_sub_group"
    t.string "alim_sub_sub_group"
    t.string "kcalfor100g"
    t.string "proteinfor100g"
    t.string "carbohydratefor100g"
    t.string "lipidfor100g"
    t.string "sugarfor100g"
    t.string "cholesterolfor100g"
    t.string "saltfor100g"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "join_recipe_foods", force: :cascade do |t|
    t.bigint "recipe_id"
    t.bigint "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_join_recipe_foods_on_food_id"
    t.index ["recipe_id"], name: "index_join_recipe_foods_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.integer "forhowmany"
    t.integer "cookingtime"
    t.string "budget"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.decimal "weight"
    t.decimal "height"
    t.integer "age"
    t.string "gender"
    t.string "physical_activity"
    t.string "objective"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "join_recipe_foods", "foods"
  add_foreign_key "join_recipe_foods", "recipes"
end
