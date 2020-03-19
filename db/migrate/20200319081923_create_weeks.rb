class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
      t.belongs_to :user_id, foreign_key: true
      t.references :monday, foreign_key: true
      t.references :tuesday, foreign_key: true
      t.references :wednesday, foreign_key: true
      t.references :thursday, foreign_key: true
      t.references :friday, foreign_key: true
      t.references :saturday, foreign_key: true
      t.references :sunday, foreign_key: true

      t.timestamps
    end
  end
end
