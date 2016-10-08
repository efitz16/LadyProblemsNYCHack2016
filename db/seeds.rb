# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user = User.create(username: , email: , password: , city: , state: , insurance_company: , policy_name: , bio: , medical_professional: , race: , birthday: )
# yyyy/mm/dd
user = User.create(username: "User1", email: "user1@me.com", password: "Password1", city: "Bronx", state: "New York", insurance_company: "GHI", policy_name: "family", bio: "Hello world", medical_professional: false, race: "Black", birthday: '1991/09/13')

user = User.create(username: "User2", email: "user2@me.com", password: "Password2", city: "Brooklyn", state: "New York", insurance_company: "GHI", policy_name: "family", bio: "Hello world 2", medical_professional: false, race: "White", birthday: '1986/07/10')

user = User.create(username: "User3", email: "user3@me.com", password: "Password3", city: "Albany", state: "New York", insurance_company: "GHI", policy_name: "single", bio: "Hello world dfghjk", medical_professional: false, race: "Hispanic", birthday: '1954/10/09')

user = User.create(username: "User4", email: "user4@me.com", password: "Password4", city: "Paris", state: "Kentucky", insurance_company: "GHI", policy_name: "single", bio: "Hello worlds", medical_professional: false, race: "White", birthday: '1963/11/19')

users = User.all

procedures = ["Hysterectomy", "C-section", "Gynecology exam", "check up", "Pap smear", "IUD (intrauterine device)"]

facilities = ["Hospital 1", "Hospital 2", "Clinic 1", "Clinic 2"]

years = [2013, 2014, 2015, 2012, 2016]

47.times do |i|
  user = users.sample
  procedure = Entry.create(procedure_name: procedures.sample, user: user, city: user.city, state: user.state, facility_name: facilities.sample, year: years.sample)
end
