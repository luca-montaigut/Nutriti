class Meal < ApplicationRecord
  belongs_to :starter, class_name: 'Recipe'
  belongs_to :dish, class_name: 'Recipe'
  belongs_to :dessert, class_name: 'Food'
  belongs_to :drink, class_name: 'Food'
  belongs_to :complement, class_name: 'Food'
end
