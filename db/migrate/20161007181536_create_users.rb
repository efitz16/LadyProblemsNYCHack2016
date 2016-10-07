class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
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
