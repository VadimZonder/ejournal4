class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.datetime :date_time
      t.string :classes
      t.string :teacher
      t.string :grade
      t.string :email
      t.string :comment

      t.timestamps null: false
    end
  end
end
