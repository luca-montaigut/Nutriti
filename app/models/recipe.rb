class Recipe < ApplicationRecord
  has_many :join_recipe_foods
  has_many :foods, through: :join_recipe_foods
  accepts_nested_attributes_for :join_recipe_foods, allow_destroy: true, reject_if: ['alim_code'].blank? 

end
