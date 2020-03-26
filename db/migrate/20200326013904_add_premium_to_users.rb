class AddPremiumToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_premium, :boolean, :default => false
  end
end
