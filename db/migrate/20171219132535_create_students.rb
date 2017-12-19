class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :surname
      t.integer :Day_of_Birth
      t.integer :Month_of_Birth
      t.integer :Year_of_Birthd
      t.string :schools_name

      t.timestamps null: false
    end
  end
end
