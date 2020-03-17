class JoinRecipeFood < ApplicationRecord
  belongs_to :recipe, optional: true
  belongs_to :food

  def kcal
    (self.food.kcalfor100g.to_f / 100) * self.quantity
  end

  def protein
    (self.food.proteinfor100g.to_f / 100) * self.quantity
  end
end
