class Day < ApplicationRecord
  belongs_to :breakfast, class_name: 'Meal'
  belongs_to :lunch, class_name: 'Meal'
  belongs_to :dinner, class_name: 'Meal'

  has_many :monday_weeks, foreign_key: 'monday_id', class_name: 'Week'
  has_many :tuesay_weeks, foreign_key: 'tuesay_id', class_name: 'Week'
  has_many :wednesday_weeks, foreign_key: 'wednesday_id', class_name: 'Week'
  has_many :thusday_weeks, foreign_key: 'thusday_id', class_name: 'Week'
  has_many :friday_weeks, foreign_key: 'friday_id', class_name: 'Week'
  has_many :saturday_weeks, foreign_key: 'saturday_id', class_name: 'Week'
  has_many :sunday_weeks, foreign_key: 'sunday_id', class_name: 'Week'

  def day_generate(day)

    case day
    when "Monday"
      self.name = "Monday"
    when "Tuesday"
      self.name = "Tuesday"
    when "Wednesday"
      self.name = "Wednesday"
    when "Thursday"
      self.name = "Thursday"
    when "Friday"
      self.name = "Friday"
    when "Saturday"
      self.name = "Saturday"
    else
      self.name = "Sunday"
    end

    @breakfast = Meal.new.generate("Breakfast")
    @breakfast.save

    @lunch = Meal.new.generate("Lunch")
    @lunch.save

    @dinner = Meal.new.generate("Dinner")
    @dinner.save


    self.breakfast = @breakfast
    self.lunch = @lunch
    self.dinner = @dinner

    return self
  end
end
