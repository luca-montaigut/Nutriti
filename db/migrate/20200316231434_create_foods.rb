class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods, id: false do |t|
      t.string :alim_code, null: false
      t.string :alim_name
      t.string :alim_group
      t.string :alim_sub_group
      t.string :alim_sub_sub_group
      t.decimal :kcalfor100g
      t.decimal :proteinfor100g
      t.decimal :carbohydratefor100g
      t.decimal :lipidfor100g
      t.decimal :sugarfor100g
      t.decimal :cholesterolfor100g
      t.decimal :saltfor100g

      t.timestamps
    end
    add_index :foods, :alim_code, unique: true
  end
end
