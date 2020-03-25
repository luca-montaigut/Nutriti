class User < ApplicationRecord
  after_create :user_week
  after_create :welcome_mail
  after_update :get_age

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :recoverable, :rememberable, :validatable

  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one :week
  has_one :breakfast

  def get_age
    if self.birthdate
      (Time.now.year - self.birthdate.year)
    else
      return 0
    end
  end

  def mb
    if self.gender == "Homme"
      ((13.707 * self.weight) + (492.3 * (self.height / 100.00).to_d) - (6.673 * self.get_age) + 77.607).to_d
    elsif self.gender == "Femme"
      ((9.740 * self.weight) + (172.9 * (self.height / 100.00).to_d) - (4.737 * self.get_age) + 667.051).to_d
    else
      return 0.0
    end
  end

  def drc
    if (self.gender == "Homme")
      self.mb * self.physical_activity.to_d
    else
      self.mb * self.physical_activity.to_d
    end
  end

  def welcome_mail
    UserMailer.welcome_email(self).deliver_now
  end

  def incomplete_profile?
    self.drc == 0.0
  end

  def needbymeal(meal)
    if meal == self.breakfast
      self.breakfast_needs
    elsif meal == "Lunch"
      self.lunch_needs
    else meal == "Dinner"
      self.dinner_needs
    end
  end

  def breakfast_needs
    (self.drc / 100) * 25
  end

  def lunch_needs
    (self.drc / 100) * 40
  end

  def dinner_needs
    (self.drc / 100) * 35
  end

  def shopping_cart
    array = []
    sorted = []
    self.week.days.each  do |day|
      day.meals.each do |meal|
        meal.recipes.each do |recipe|
          if meal == self.breakfast
            recipe.join_recipe_foods.each do |join|
              array << {join.food.alim_name.match('^[^\,(]*') => (join.quantity.to_f * (1.0/join.recipe.forhowmany.to_f).to_f) * (self.needbymeal(meal)/meal.kcal).to_f}
            end
          else   
            recipe.join_recipe_foods.each do |join|
              array << {join.food.alim_name.match('^[^\,(]*') => (join.quantity.to_f * (1.0/join.recipe.forhowmany.to_f).to_f) * (self.needbymeal(meal.category)/meal.kcal).to_f}
            end
          end
        end
      end
    end

    array.reduce {|acc, h| acc.merge(h) {|_,v1,v2| v1 + v2 }}
  end
  
  private
  
  def user_week
    user_breakfast = Breakfast.create(user_id: self.id)
    user_breakfast.generate
    user_breakfast.total_kcal
    user_week = Week.create(user_id: self.id)
    user_week.generate
  end
end
