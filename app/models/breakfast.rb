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

    self.update(hotdrink: @hotdrink)
    self.update(fruit: @fruit)
    self.update(cereal: @cereal)
    self.update(protein: @protein)
    self.update(option: @option)

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


end
