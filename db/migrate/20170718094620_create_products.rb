class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :category
      t.datetime :date
      t.boolean :activate

      t.timestamps
    end
  end
end
