# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'faker'

JoinRecipeFood.destroy_all
Food.destroy_all
Recipe.destroy_all
Week.destroy_all
Day.destroy_all
Meal.destroy_all
User.destroy_all


csv_text = File.read(Rails.root.join('lib', 'seeds', 'foods_nutriti.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  food = Food.new
  food.alim_code = row['alim_code']
  food.alim_name = row['alim_name']
  food.alim_group = row['alim_group']
  food.alim_sub_group = row['alim_sub_group']
  food.alim_sub_sub_group = row['alim_sub_sub_group']
  food.kcalfor100g = row['kcalfor100g']
  food.proteinfor100g = row['proteinfor100g']
  food.carbohydratefor100g = row['carbohydratefor100g']
  food.lipidfor100g = row['lipidfor100g']
  food.sugarfor100g = row['sugarfor100g']
  food.cholesterolfor100g = row['cholesterolfor100g']
  food.saltfor100g = row['saltfor100g']
  food.basic_unity = row['basic_unity']
  food.thousand_unity = row['thousand_unity']
  food.weight_for_one = row['weight_for_one']
  food.save
end

puts "There are now #{Food.count} foods in database"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'recipes_nutriti.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  r = Recipe.new
  r.title = row['title']
  r.forhowmany = row['forhowmany']
  r.cookingtime = row['cookingtime']
  r.budget = row['budget']
  r.category = row['category']
  r.url = row['url']
  r.save
end

puts "There are now #{Recipe.count} recipes in database"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'join_recipe_foods_nutriti.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  j = JoinRecipeFood.new
  j.recipe_id = Recipe.find_by(title: row['recipe_id']).id
  j.food_id = row['food_id']
  j.quantity = row['quantity']
  j.save
end

puts "There are now #{JoinRecipeFood.count} ingredients to complete yours recipes in database"

User.create(
  first_name: "Lazy",
  last_name: "Rabbit",
  email: "lazyrabbit@yopmail.com",
  password: 123456,
  height: 180,
  weight: 65,
  gender: "Homme",
  birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
  physical_activity: 1.37,
  is_admin: true
)

puts "There are now an user who is admin in database"
