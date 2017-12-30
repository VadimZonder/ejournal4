class CreateParentFilters < ActiveRecord::Migration
  def change
    create_table :parent_filters do |t|
      t.string :filter

      t.timestamps null: false
    end
  end
end
