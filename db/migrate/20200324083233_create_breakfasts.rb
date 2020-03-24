class CreateBreakfasts < ActiveRecord::Migration[5.2]
  def change
    create_table :breakfasts do |t|
      t.belongs_to :user, index: true
      t.references :hotdrink, index: true
      t.references :fruit, index: true
      t.references :cereal, index: true
      t.references :protein, index: true
      t.references :option, index: true
      t.decimal :kcal, default: 0

      t.timestamps
    end
  end
end
