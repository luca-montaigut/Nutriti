class Week < ApplicationRecord
  belongs_to :user

  has_many :day
  has_many :meal , through: :day

  belongs_to :monday, class_name: 'Day', optional: true
  belongs_to :tuesday, class_name: 'Day', optional: true
  belongs_to :wednesday, class_name: 'Day', optional: true
  belongs_to :thursday, class_name: 'Day', optional: true
  belongs_to :friday, class_name: 'Day', optional: true
  belongs_to :saturday, class_name: 'Day', optional: true
  belongs_to :sunday, class_name: 'Day', optional: true
end
