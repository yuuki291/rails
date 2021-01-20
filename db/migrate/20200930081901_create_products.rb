class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :novel
      t.string :model
      t.text :description
      t.string :finish
      t.string :title
      t.decimal :price

      t.timestamps
    end
  end
end
