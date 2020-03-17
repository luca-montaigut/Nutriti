class Recipe < ApplicationRecord
  has_many :join_recipe_foods
  has_many :foods, through: :join_recipe_foods
  accepts_nested_attributes_for :join_recipe_foods, allow_destroy: true, reject_if: ['food_id'].blank?
  
  def total_kcal
    self.join_recipe_foods.map { |food| food.kcal}.sum
  end

  def total_prot
    self.join_recipe_foods.map { |food| food.protein}.sum
  end
end
