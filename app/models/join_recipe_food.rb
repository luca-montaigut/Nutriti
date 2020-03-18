class JoinRecipeFood < ApplicationRecord
  belongs_to :recipe, optional: true
  belongs_to :food

  def kcal
    (self.food.kcalfor100g.to_f / 100) * self.quantity
  end

  def protein
    (self.food.proteinfor100g.to_f / 100) * self.quantity
  end

  def sugar 
    (self.food.sugarfor100g.to_f / 100) * self.quantity
  end

  def chol
    (self.food.cholesterolfor100g.to_f / 100) * self.quantity
  end

  def carb
    (self.food.carbohydratefor100g.to_f / 100) * self.quantity
  end

  def salt
    (self.food.saltfor100g.to_f / 100) * self.quantity
  end

  def lipid
    (self.food.ipidfor100g.to_f / 100) * self.quantity
  end
end
