class AddExpressToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :express, :boolean, :default => false
  end
end
