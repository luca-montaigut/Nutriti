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

ActiveRecord::Schema.define(version: 2020_03_25_171829) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breakfasts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "hotdrink_id"
    t.bigint "fruit_id"
    t.bigint "cereal_id"
    t.bigint "protein_id"
    t.bigint "option_id"
    t.decimal "kcal", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cereal_id"], name: "index_breakfasts_on_cereal_id"
    t.index ["fruit_id"], name: "index_breakfasts_on_fruit_id"
    t.index ["hotdrink_id"], name: "index_breakfasts_on_hotdrink_id"
    t.index ["option_id"], name: "index_breakfasts_on_option_id"
    t.index ["protein_id"], name: "index_breakfasts_on_protein_id"
    t.index ["user_id"], name: "index_breakfasts_on_user_id"
  end

  create_table "days", force: :cascade do |t|
    t.string "name"
    t.bigint "breakfast_id"
    t.bigint "lunch_id"
    t.bigint "dinner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["breakfast_id"], name: "index_days_on_breakfast_id"
    t.index ["dinner_id"], name: "index_days_on_dinner_id"
    t.index ["lunch_id"], name: "index_days_on_lunch_id"
  end

  create_table "foods", id: false, force: :cascade do |t|
    t.string "alim_code", null: false
    t.string "alim_name"
    t.string "alim_group"
    t.string "alim_sub_group"
    t.string "alim_sub_sub_group"
    t.decimal "kcalfor100g"
    t.decimal "proteinfor100g"
    t.decimal "carbohydratefor100g"
    t.decimal "lipidfor100g"
    t.decimal "sugarfor100g"
    t.decimal "cholesterolfor100g"
    t.decimal "saltfor100g"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "basic_unity"
    t.string "thousand_unity"
    t.decimal "weight_for_one"
    t.index ["alim_code"], name: "index_foods_on_alim_code", unique: true
  end

  create_table "join_recipe_foods", force: :cascade do |t|
    t.bigint "recipe_id"
    t.bigint "food_id"
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_join_recipe_foods_on_food_id"
    t.index ["recipe_id"], name: "index_join_recipe_foods_on_recipe_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "category"
    t.bigint "starter_id"
    t.bigint "dish_id"
    t.bigint "dessert_id"
    t.bigint "drink_id"
    t.bigint "complement_id"
    t.decimal "kcal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["complement_id"], name: "index_meals_on_complement_id"
    t.index ["dessert_id"], name: "index_meals_on_dessert_id"
    t.index ["dish_id"], name: "index_meals_on_dish_id"
    t.index ["drink_id"], name: "index_meals_on_drink_id"
    t.index ["starter_id"], name: "index_meals_on_starter_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.integer "forhowmany"
    t.integer "cookingtime"
    t.string "budget"
    t.string "category"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "sans_porc", default: true
    t.boolean "vegetarien", default: false
    t.boolean "vegan", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "weight", default: 0
    t.integer "height", default: 0
    t.date "birthdate"
    t.string "gender"
    t.string "physical_activity", default: "0"
    t.string "objective"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.boolean "is_admin", default: false
    t.boolean "express", default: false
    t.boolean "sans_porc", default: false
    t.boolean "vegetarien", default: false
    t.boolean "vegan", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weeks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "monday_id"
    t.bigint "tuesday_id"
    t.bigint "wednesday_id"
    t.bigint "thursday_id"
    t.bigint "friday_id"
    t.bigint "saturday_id"
    t.bigint "sunday_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friday_id"], name: "index_weeks_on_friday_id"
    t.index ["monday_id"], name: "index_weeks_on_monday_id"
    t.index ["saturday_id"], name: "index_weeks_on_saturday_id"
    t.index ["sunday_id"], name: "index_weeks_on_sunday_id"
    t.index ["thursday_id"], name: "index_weeks_on_thursday_id"
    t.index ["tuesday_id"], name: "index_weeks_on_tuesday_id"
    t.index ["user_id"], name: "index_weeks_on_user_id"
    t.index ["wednesday_id"], name: "index_weeks_on_wednesday_id"
  end

end
