class AddDietsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :porkless, :boolean, :default => false
    add_column :users, :vegetarian, :boolean, :default => false
    add_column :users, :vegan, :boolean, :default => false
  end
end
