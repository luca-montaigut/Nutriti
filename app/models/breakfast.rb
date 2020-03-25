class Breakfast < ApplicationRecord
  after_create :generate

  belongs_to :user

  belongs_to :hotdrink, class_name: 'Recipe', optional: true
  belongs_to :fruit, class_name: 'Recipe', optional: true
  belongs_to :cereal, class_name: 'Recipe', optional: true
  belongs_to :protein, class_name: 'Recipe', optional: true
  belongs_to :option, class_name: 'Recipe', optional: true

  has_many :breakfast_days, foreign_key: 'breakfast_id', class_name: 'Day'

  def generate
    @hotdrink = Recipe.all.where(category: "Hot Drink").sample
    @fruit = Recipe.all.where(category: "Juice").sample
    @cereal = Recipe.all.where(category: "Cereal (Breakfast)").sample
    @protein = Recipe.all.where(category: "Protein (Breakfast)").sample
    @option = Recipe.all.where(category: "Option (Breakfast)").sample

    self.update(
      hotdrink: @hotdrink,
      fruit: @fruit,
      cereal: @cereal,
      protein: @protein,
      option: @option
    )

  end
  
  def recipes
    [
      self.hotdrink,
      self.fruit,
      self.cereal,
      self.protein,
      self.option
    ]
  end

  def list(user) 
    array = []
    self.recipes.each do |join|
      join.join_recipe_foods.each do |m|
        array << {m.food.alim_name.match('^[^\(]*') => (m.quantity.to_f * (1.0/m.recipe.forhowmany.to_f).to_f) * (user.needbymeal(self)/self.kcal).to_f}
      end
    end

    array.reduce {|acc, h| acc.merge(h) {|_,v1,v2| v1 + v2 }}
  end


  def total_kcal
    self.update(kcal: self.hotdrink.for_one + self.fruit.for_one + self.protein.for_one + self.cereal.for_one + self.option.for_one)
  end

end
