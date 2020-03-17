class CreateJoinRecipeFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :join_recipe_foods do |t|
      t.belongs_to :recipe, foreign_key: true
      t.belongs_to :food, foreign_key: true

      t.timestamps
    end
  end
end
