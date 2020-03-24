class Day < ApplicationRecord
  belongs_to :breakfast, class_name: 'Breakfast'
  belongs_to :lunch, class_name: 'Meal'
  belongs_to :dinner, class_name: 'Meal'

  has_many :meal
  has_many :recipe, through: :meal

  has_many :monday_weeks, foreign_key: 'monday_id', class_name: 'Week'
  has_many :tuesay_weeks, foreign_key: 'tuesay_id', class_name: 'Week'
  has_many :wednesday_weeks, foreign_key: 'wednesday_id', class_name: 'Week'
  has_many :thusday_weeks, foreign_key: 'thusday_id', class_name: 'Week'
  has_many :friday_weeks, foreign_key: 'friday_id', class_name: 'Week'
  has_many :saturday_weeks, foreign_key: 'saturday_id', class_name: 'Week'
  has_many :sunday_weeks, foreign_key: 'sunday_id', class_name: 'Week'

  def generate(day, user)

    case day
    when "Monday"
      self.name = "Lundi"
    when "Tuesday"
      self.name = "Mardi"
    when "Wednesday"
      self.name = "Mercredi"
    when "Thursday"
      self.name = "Jeudi"
    when "Friday"
      self.name = "Vendredi"
    when "Saturday"
      self.name = "Samedi"
    else "Sunday"
      self.name = "Dimanche"
    end

    @breakfast = user.breakfast

    @lunch = Meal.new.generate("Lunch")
    @lunch.save

    @dinner = Meal.new.generate("Dinner")
    @dinner.save


    self.breakfast = @breakfast
    self.lunch = @lunch
    self.dinner = @dinner

    return self
  end

  def meals
    [
      self.breakfast,
      self.lunch,
      self.dinner
    ]
  end
end
