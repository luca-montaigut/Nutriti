class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.integer :alim_code
      t.string :alim_name
      t.string :alim_group
      t.string :alim_sub_group
      t.string :alim_sub_sub_group
      t.string :kcalfor100g
      t.string :proteinfor100g
      t.string :carbohydratefor100g
      t.string :lipidfor100g
      t.string :sugarfor100g
      t.string :cholesterolfor100g
      t.string :saltfor100g

      t.timestamps
    end
  end
end
