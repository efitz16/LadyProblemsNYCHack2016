class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.references :entry, foreign_key: true
      t.decimal :total_without_coverage
      t.string :insurance_company
      t.string :policy_name
      t.decimal :final_cost

      t.timestamps
    end
  end
end
