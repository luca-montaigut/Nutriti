class Food < ApplicationRecord
  has_many :join_recipe_foods
  has_many :recipes, through: :join_recipe_foods
end
