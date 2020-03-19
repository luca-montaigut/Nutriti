# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
require 'faker'

Food.destroy_all
Recipe.destroy_all
JoinRecipeFood.destroy_all
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
  food.save

end

puts "There are now #{Food.count} foods in database"

Recipe.create(title: "Eau minérale", forhowmany: 1, cookingtime: 1, budget:  "Bon Marché", category:  "Drink", url: "") 
Recipe.create(title: "Pain", forhowmany: 1, cookingtime: 1, budget:  "Bon Marché", category:  "Complement", url: "")  
Recipe.create(title: "Pomme", forhowmany: 1, cookingtime: 1, budget:  "Bon Marché", category:  "Dessert", url: "")  
Recipe.create(title: "Banane", forhowmany: 1, cookingtime: 1, budget:  "Bon Marché", category:  "Dessert", url: "")  
Recipe.create(title: "Tian de légumes du soleil", forhowmany: 4, cookingtime: 10, budget:  "Bon marché", category:  "Starter", url:  "")
Recipe.create(title: "Petit salé aux lentilles" , forhowmany: 6, cookingtime: 15, budget:  "Bon marché", category:  "Dish", url:  "")
Recipe.create(title: "Croque-monsieur" , forhowmany: 6, cookingtime: 10, budget:  "Bon marché", category:  "Dish", url:  "")

puts "There are now #{Recipe.count} recipes in database"

JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Pomme").id, food_id: 13050, quantity: 150)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Eau minérale").id, food_id: 18044, quantity: 500)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Banane").id, food_id: 13005, quantity: 120)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Tian de légumes du soleil").id, food_id: 20002, quantity: 250)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Tian de légumes du soleil").id, food_id: 20047, quantity: 300)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Tian de légumes du soleil").id, food_id: 11070, quantity: 1)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Tian de légumes du soleil").id, food_id: 11000, quantity: 16)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Tian de légumes du soleil").id, food_id: 11058, quantity: 1)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Tian de légumes du soleil").id, food_id: 11015, quantity: 1)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title:"Petit salé aux lentilles").id, food_id: 28550, quantity: 1200)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title:"Petit salé aux lentilles").id, food_id: 30104, quantity: 300)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title:"Petit salé aux lentilles").id, food_id: 20587, quantity: 400)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title:"Petit salé aux lentilles").id, food_id: 11174, quantity: 10)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title:"Petit salé aux lentilles").id, food_id: 20008, quantity: 125)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title:"Petit salé aux lentilles").id, food_id: 11052, quantity: 1)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title:"Petit salé aux lentilles").id, food_id: 11053, quantity: 1)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Croque-monsieur").id, food_id: 16400, quantity: 50)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Croque-monsieur").id, food_id: 9545, quantity: 50)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Croque-monsieur").id, food_id: 19041, quantity: 1000)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Croque-monsieur").id, food_id: 11058, quantity: 1)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Croque-monsieur").id, food_id: 11015, quantity: 1)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Croque-monsieur").id, food_id: 7200, quantity: 170)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Croque-monsieur").id, food_id: 12118, quantity: 80)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Croque-monsieur").id, food_id: 11013, quantity: 40)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Croque-monsieur").id, food_id: 28925, quantity: 300)
JoinRecipeFood.create(recipe_id: Recipe.find_by(title: "Pain").id, food_id: 7000, quantity: 70)

puts "There are now #{JoinRecipeFood.count} ingredients to complete yours recipes in database"

User.create(
  first_name: "Lazy",
  last_name: "Rabbit",
  email: "lazyrabbit@yopmail.com",
  password: 123456,
  height: 35,
  weight: 5,
  birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
  physical_activity: 1.37
)

puts "There are now an user who is admin in database"