class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :procedure_name, null: false
      t.references :user, foreign_key: true
      t.string :city
      t.string :state
      t.text :details
      t.string :facility_name
      t.integer :year, null: false

      t.timestamps
    end
  end
end
