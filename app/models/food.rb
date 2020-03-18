class Food < ApplicationRecord
  self.primary_key = :alim_code
  has_many :join_recipe_foods
  has_many :recipes, through: :join_recipe_foods

  has_many :dessert_meal, foreign_key: 'dessert_id', class_name: 'Meal'
  has_many :drink_meal, foreign_key: 'drink_id', class_name: 'Meal'
  has_many :complement_meal, foreign_key: 'complement_id', class_name: 'Meal'

end
