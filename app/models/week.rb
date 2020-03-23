class Week < ApplicationRecord
  belongs_to :user

  belongs_to :monday, class_name: 'Day', optional: true
  belongs_to :tuesday, class_name: 'Day', optional: true
  belongs_to :wednesday, class_name: 'Day', optional: true
  belongs_to :thursday, class_name: 'Day', optional: true
  belongs_to :friday, class_name: 'Day', optional: true
  belongs_to :saturday, class_name: 'Day', optional: true
  belongs_to :sunday, class_name: 'Day', optional: true

  def generate
    @monday = Day.new.generate("Monday")
    @monday.save
    @tuesday = Day.new.generate("Tuesday")
    @tuesday.save
    @wednesday = Day.new.generate("Wednesday")
    @wednesday.save
    @thursday = Day.new.generate("Thursday")
    @thursday.save
    @friday = Day.new.generate("Friday")
    @friday.save
    @saturday = Day.new.generate("Saturday")
    @saturday.save
    @sunday = Day.new.generate("Sunday")
    @sunday.save

    self.update(monday: @monday)
    self.update(tuesday: @tuesday)
    self.update(wednesday: @wednesday)
    self.update(thursday: @thursday)
    self.update(friday: @friday)
    self.update(saturday: @saturday)
    self.update(sunday: @sunday)

    return self
  end

  def days
    [self.monday,
    self.tuesday,
    self.wednesday,
    self.thursday,
    self.friday,
    self.saturday,
    self.sunday]
  end
end
