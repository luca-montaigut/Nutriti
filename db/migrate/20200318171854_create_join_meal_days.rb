class CreateJoinMealDays < ActiveRecord::Migration[5.2]
  def change
    create_table :join_meal_days do |t|
      t.belongs_to :day, index: true
      t.belongs_to :meal, index: true
      t.text :meal_name

      t.timestamps
    end
  end
end
