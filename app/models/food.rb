class Food < ApplicationRecord
  self.primary_key = :alim_code
  has_many :join_recipe_foods
  has_many :recipes, through: :join_recipe_foods

end
