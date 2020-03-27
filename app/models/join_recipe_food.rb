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
    (self.food.lipidfor100g.to_f / 100) * self.quantity
  end

  def self.join_to_csv
	join_attributes = %w{recipe_id food_id quantity}

	CSV.generate(headers: true) do |csv|
	  csv << join_attributes

	  all.find_each do |join|
		csv << join_attributes.map{ |attr| join.send(attr) }
	  end
	end
  end

end
