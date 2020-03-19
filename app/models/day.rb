class Day < ApplicationRecord
  belongs_to :breakfast, class_name: 'Meal'
  belongs_to :lunch, class_name: 'Meal'
  belongs_to :dinner, class_name: 'Meal'
end
