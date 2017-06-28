class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :color
      t.integer :status
      t.date :inward_date
      t.string :type
      t.text :description

      t.timestamps
    end
  end
end
