class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms do |t|
      t.string :name
      t.integer :phone
      t.string :adress
      t.text :form

      t.timestamps
    end
  end
end
