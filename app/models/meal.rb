class Meal < ApplicationRecord
  after_create :total_kcal

  belongs_to :starter, class_name: 'Recipe'
  belongs_to :dish, class_name: 'Recipe'
  belongs_to :dessert, class_name: 'Recipe'
  belongs_to :drink, class_name: 'Recipe'
  belongs_to :complement, class_name: 'Recipe'

  
  has_many :lunch_days, foreign_key: 'lunch_id', class_name: 'Day'
  has_many :dinner_days, foreign_key: 'dinner_id', class_name: 'Day'


  def generate(category, user)

    if category == "Lunch"
      self.category = "Déjeuner"
    else category == "Dinner"
      self.category = "Dîner"
    end

    all_recipes = Recipe.all

    if user.express == true
      all_recipes = all_recipes.where("cookingtime <= 15")
    end

    if user.porkless
      all_recipes = all_recipes.where(porkless: true)
    end
    
    if user.vegetarian
      all_recipes = all_recipes.where(vegetarian: true)
    end

    if user.vegan
      all_recipes = all_recipes.where(vegan: true)
    end

    self.starter = all_recipes.where(category: "Starter").sample
    self.dish_id = all_recipes.where(category: "Dish").sample.id
    self.dessert_id = all_recipes.where(category: "Fruit").sample.id
    self.drink_id = all_recipes.where(category: "Drink").sample.id # Eau minérale
    self.complement_id = all_recipes.where(category: "Complement").sample.id # Pain

    return self
  end

  def recipes
    [
      self.starter,
      self.dish,
      self.dessert,
      self.drink,
      self.complement
    ]
  end

  def list(user) 
    array = []
    self.recipes.each do |join|
      join.join_recipe_foods.each do |m|
        array << {m.food.alim_name.match('^[^\,(]*') => (m.quantity.to_f * (1.0/m.recipe.forhowmany.to_f).to_f) * (user.needbymeal(self.category)/self.kcal).to_f}
      end
    end

    array.reduce {|acc, h| acc.merge(h) {|_,v1,v2| v1 + v2 }}
  end

  private
  def total_kcal
    self.update(kcal: self.starter.for_one + self.dish.for_one + self.dessert.for_one + self.drink.for_one + self.complement.for_one)
  end
end
