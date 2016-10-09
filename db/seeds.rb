require 'faker'
Item.delete_all
Bill.delete_all
Entry.delete_all
User.delete_all

40.times do
  User.create!({ username: Faker::Internet.user_name + "_" + Faker::Internet.user_name,
                bio: Faker::Lorem.paragraph,
                city: Faker::Address.city,
                state: Faker::Address.state,
                email: Faker::Internet.email,
                password: "password123",
                insurance_company: ["Lady Problems Insurance","Hackathon Insurance"].sample,
                policy_name: ["Family Plan B-12", "Individual Platinum"].sample,
                medical_professional: [true, false].sample,
                race: ["White", "Black or African American", "Asian", "Native Hawaiian or Other Pacific Islander", "American Indian or Alaska Native"].sample,
                birthday: rand(Date.civil(1960, 1, 1)..Date.civil(2002, 12, 31))
                })
end

# one = User.find(1)
# two = User.find(2)
# three = User.find(3)
# four = User.find(4)
#
# entry1 = one.entries.create!({procedure_name: ["General Checkup", "Hysterectomy", "Mammography", "Delivery", "Colposcopy"].sample,
#                         city: Faker::Address.city,
#                         state: Faker::Address.state,
#                         details: Faker::Lorem.paragraph,
#                         year: 2010 + rand(6)
#                         })
#
# bill1 = entry1.bills.create!({total_without_coverage: rand(1500.00..3000.00),
#                               insurance_company: ["Lady Problems Insurance","Hackathon Insurance"].sample,
#                               policy_name: ["Family Plan B-12", "Individual Platinum"].sample,
#                               final_cost: rand(40.00..1500.00)
#                               })
#                                                                                   3.times do
#   bill1.items.create!({item_name: ["Lab Test", "Surgery", "Screening"].sample,
#         price: rand(10.00..400.00),
#         quantity: [nil, 12, 5, 2].sample                                                                             })
#       end
#
# entry1b = one.entries.create!({procedure_name: ["General Checkup", "Hysterectomy", "Mammography", "Delivery", "Colposcopy"].sample,
#                               city: Faker::Address.city,
#                               state: Faker::Address.state,
#                               details: Faker::Lorem.paragraph,
#                               facility_name: ["Maple Valley General Hospital", "Spring Grove Hospital", "Maple Grove Medical Clinic", "Blossom Community Hospital"].sample,
#                               year: 2010 + rand(6)
#                               })
#
# entry2 = two.entries.create!({procedure_name: ["General Checkup", "Hysterectomy", "Mammography", "Delivery", "Colposcopy"].sample,
#                               city: Faker::Address.city,
#                               state: Faker::Address.state,
#                               details: Faker::Lorem.paragraph,
#                               facility_name: ["Maple Valley General Hospital", "Spring Grove Hospital", "Maple Grove Medical Clinic", "Blossom Community Hospital"].sample,
#                               year: 2010 + rand(6)
#                               })
#
# bill2 = entry2.bills.create!({total_without_coverage: rand(1500.00..3000.00),
#                               insurance_company: ["Lady Problems Insurance","Hackathon Insurance"].sample,
#                               policy_name: ["Family Plan B-12", "Individual Platinum"].sample,
#                               final_cost: rand(40.00..1500.00)
#                               })
#                                                                                   6.times do
#     bill2.items.create!({item_name: ["Lab Test", "Surgery", "Prescribed Medication", "Screening"].sample,
#     price: rand(10.00..400.00),
#     quantity: [nil, 12, 5, 2].sample                                                                             })
#     end
#
# bill2b = entry2.bills.create!({total_without_coverage: rand(1500.00..3000.00),
#                                   insurance_company: ["Lady Problems Insurance","Hackathon Insurance"].sample,
#                                   policy_name: ["Family Plan B-12", "Individual Platinum"].sample,
#                                   final_cost: rand(40.00..1500.00)
#                                   })
#                                                                                  2.times do
#         bill2b.items.create!({item_name: ["Lab Test", "Surgery", "Prescribed Medication", "Screening"].sample,
#         price: rand(10.00..400.00),
#         quantity: [nil, 12, 5, 2].sample                                                                 })
#         end
#
# entry3 = three.entries.create!({procedure_name: ["General Checkup", "Hysterectomy", "Mammography", "Delivery", "Colposcopy"].sample,
#                             city: Faker::Address.city,
#                             state: Faker::Address.state,
#                             details: Faker::Lorem.paragraph,
#                             year: 2010 + rand(6)
#                             })
#
# bill3 = entry3.bills.create!({total_without_coverage: rand(1500.00..3000.00),
#                                   insurance_company: ["Lady Problems Insurance","Hackathon Insurance"].sample,
#                                   policy_name: ["Family Plan B-12", "Individual Platinum"].sample,
#                                   final_cost: rand(40.00..1500.00)
#                                   })
#                                                                                   4.times do
#     bill3.items.create!({item_name: ["Lab Test", "Surgery", "Prescribed Medication", "Screening"].sample,
#     price: rand(10.00..400.00),
#     quantity: [nil, 12, 5, 2].sample                                                                             })
#     end

130.times do |i|
  Entry.create!({procedure_name: ["General Checkup", "Hysterectomy", "Mammography", "Delivery", "Colposcopy", "Pap Smear"].sample,
                              city: Faker::Address.city,
                              state: Faker::Address.state,
                              details: Faker::Lorem.paragraph,
                              year: 2010 + rand(6),
                              user: User.all.sample
                              })
end

# pap_smears = Entry.where(procedure_name: "Pap Smear")

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
              state: Faker::Address.state,
              email: "lady_doctor@gmail.com",
              password: "password123",
              insurance_company: "Lady Problems Insurance",
              policy_name: "Hackathon Platinum",
              medical_professional: true,
              race: "White",
              birthday: rand(Date.civil(1960, 1, 1)..Date.civil(2002, 12, 31))
              )
