class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.references :bill, foreign_key: true
      t.string :item_name
      t.decimal :price
      t.integer :quantity

      t.timestamps
    end
  end
end
