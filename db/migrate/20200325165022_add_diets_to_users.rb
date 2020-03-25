class AddDietsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sans_porc, :boolean, :default => false
    add_column :users, :vegetarien, :boolean, :default => false
    add_column :users, :vegan, :boolean, :default => false
  end
end
