class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :category
      t.references :starter, index: true
      t.references :dish, index: true
      t.references :dessert, index: true
      t.references :drink, index: true
      t.references :complement, index: true

      t.timestamps
    end
  end
end
