class Recipe < ApplicationRecord
  has_many :join_recipe_foods
  has_many :foods, through: :join_recipe_foods
  accepts_nested_attributes_for :join_recipe_foods, allow_destroy: true, reject_if: ['food_id'].blank?

  has_many :starter_meal, foreign_key: 'starter_id', class_name: 'Meal'
  has_many :dish_meal, foreign_key: 'dish_id', class_name: 'Meal'
  has_many :dessert_meal, foreign_key: 'dessert_id', class_name: 'Meal'
  has_many :drink_meal, foreign_key: 'drink_id', class_name: 'Meal'
  has_many :complement_meal, foreign_key: 'complement_id', class_name: 'Meal'
  
  validates :title,
	presence: true,
	length: { in: 3..50 }
  validates :forhowmany,
	presence: true,
	numericality: { greater_than: 0 }
  validates :cookingtime,
	presence: true,
	numericality: { greater_than: 0 }
  validates :budget,
	presence: true
  validates :category,
	presence:true

  def total_kcal
    self.join_recipe_foods.map { |food| food.kcal}.sum
  end

  def total_prot
    self.join_recipe_foods.map { |food| food.protein}.sum
  end
  
  def total_lip
    self.join_recipe_foods.map { |food| food.lip}.sum
  end

  def total_salt
    self.join_recipe_foods.map { |food| food.salt}.sum
  end

  def total_sugar
    self.join_recipe_foods.map { |food| food.sugar}.sum
  end

  def total_chol
    self.join_recipe_foods.map { |food| food.chol}.sum
  end

  def total_carb
    self.join_recipe_foods.map { |food| food.carb}.sum
  end

  def for_one
    self.total_kcal / self.forhowmany
  end

  def self.recipes_to_csv
	attributes = %w{title forhowmany cookingtime budget category url}

	CSV.generate(headers: true) do |csv|
	  csv << attributes

	  all.find_each do |recipe|
		csv << attributes.map{ |attr| recipe.send(attr) }
	  end
	end
  end

end
