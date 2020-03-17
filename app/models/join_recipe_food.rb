class JoinRecipeFood < ApplicationRecord
  belongs_to :recipe, optional: true
  belongs_to :food
end
