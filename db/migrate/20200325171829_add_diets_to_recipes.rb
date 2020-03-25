class AddDietsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :sans_porc, :boolean, :default => true
    add_column :recipes, :vegetarien, :boolean, :default => false
    add_column :recipes, :vegan, :boolean, :default => false
  end
end
