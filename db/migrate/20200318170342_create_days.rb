class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.string :name
      t.references :breakfast, index: true
      t.references :lunch, index: true
      t.references :dinner, index: true

      t.timestamps
    end
  end
end
