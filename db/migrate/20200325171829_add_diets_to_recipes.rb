class AddDietsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :porkless, :boolean, :default => true
    add_column :recipes, :vegetarian, :boolean, :default => false
    add_column :recipes, :vegan, :boolean, :default => false
  end
end
