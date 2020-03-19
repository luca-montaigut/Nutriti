class Week < ApplicationRecord
  belongs_to :user_id
  belongs_to :monday, class_name: 'Day'
  belongs_to :tuesday, class_name: 'Day'
  belongs_to :wednesday, class_name: 'Day'
  belongs_to :thursday, class_name: 'Day'
  belongs_to :friday, class_name: 'Day'
  belongs_to :saturday, class_name: 'Day'
  belongs_to :sunday, class_name: 'Day'
end
