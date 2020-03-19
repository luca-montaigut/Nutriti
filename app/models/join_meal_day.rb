class JoinMealDay < ApplicationRecord
  belongs_to :day
  belongs_to :meal
end
