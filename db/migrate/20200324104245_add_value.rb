class AddValue < ActiveRecord::Migration[5.2]
  def change
    add_column :foods, :basic_unity, :string
    add_column :foods, :thousand_unity, :string
    add_column :foods, :weight_for_one, :decimal 

  end
end
