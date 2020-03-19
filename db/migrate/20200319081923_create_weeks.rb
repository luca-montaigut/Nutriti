class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
      t.belongs_to :user, foreign_key: true
      t.references :monday, index: true
      t.references :tuesday, index: true
      t.references :wednesday, index: true
      t.references :thursday, index: true
      t.references :friday, index: true
      t.references :saturday, index: true
      t.references :sunday, index: true

      t.timestamps
    end
  end
end
