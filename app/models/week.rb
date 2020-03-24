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
    @monday = Day.new.generate("Monday", self.user)
    @monday.save
    @tuesday = Day.new.generate("Tuesday", self.user)
    @tuesday.save
    @wednesday = Day.new.generate("Wednesday", self.user)
    @wednesday.save
    @thursday = Day.new.generate("Thursday", self.user)
    @thursday.save
    @friday = Day.new.generate("Friday", self.user)
    @friday.save
    @saturday = Day.new.generate("Saturday", self.user)
    @saturday.save
    @sunday = Day.new.generate("Sunday", self.user)
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
