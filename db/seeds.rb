require 'faker'
Item.delete_all
Bill.delete_all
Entry.delete_all
User.delete_all

40.times do
  User.create!({ username: Faker::Internet.user_name + "_" + Faker::Internet.user_name,
                bio: Faker::Lorem.paragraph,
                city: Faker::Address.city,
                state: ["NY", "CA", "SC", "NC", "TX"].sample,
                email: Faker::Internet.email,
                password: "password123",
                insurance_company: ["Lady Problems Insurance","Hackathon Insurance"].sample,
                policy_name: ["Family Plan B-12", "Individual Platinum"].sample,
                medical_professional: [true, false].sample,
                race: ["White", "Black or African American", "Asian", "Native Hawaiian or Other Pacific Islander", "American Indian or Alaska Native"].sample,
                birthday: rand(Date.civil(1960, 1, 1)..Date.civil(2002, 12, 31))
                })
end

130.times do |i|
  Entry.create!({procedure_name: ["General Checkup", "Hysterectomy", "Mammogram", "Pelvic Exam", "Colposcopy", "Pap Smear", "Bone Density Test"].sample,
                              city: Faker::Address.city,
                              state: ["NY", "CA", "SC", "NC", "TX"].sample,
                              details: Faker::Lorem.paragraph,
                              year: 2010 + rand(6),
                              user: User.all.sample
                              })
end

entries = Entry.all

125.times do |b|
  entries.sample.bills.create!({total_without_coverage: rand(1500.00..3000.00),
                                  insurance_company: ["Lady Problems Insurance","HCSC Group"].sample,
                                  policy_name: ["Family Plan B-12", "Individual Platinum"].sample,
                                  final_cost: rand(40.00..1500.00)
                                  })
end

bills = Bill.all

325.times do |c|
  bills.sample.items.create!({quantity: rand(1..5),
                                  item_name: Faker::Lorem.word,
                                  price: rand(40.00..1500.00)
                                  })
end

User.create!( username: "lady_doctor",
              bio: Faker::Lorem.paragraph,
              city: Faker::Address.city,
              state: "NY",
              email: "lady_doctor@gmail.com",
              password: "password123",
              insurance_company: "Lady Problems Insurance",
              policy_name: "Hackathon Platinum",
              medical_professional: true,
              race: "White",
              birthday: Date.civil(1988, 12, 12)
              )
