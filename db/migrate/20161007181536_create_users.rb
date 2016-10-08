class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :city
      t.string :state
      t.string :insurance_company
      t.string :policy_name
      t.text :bio
      t.boolean :medical_professional
      t.string :race
      t.date :birthday

      t.timestamps
    end
  end
end
