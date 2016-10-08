require 'faker'
Item.delete_all
Bill.delete_all
Entry.delete_all
User.delete_all

4.times do
  User.create!({ username: Faker::Superhero.name,
                bio: Faker::Lorem.sentence,
                city: Faker::Address.city,
                state: Faker::Address.state,
                email: Faker::Internet.email,
                password_digest: Faker::Internet.password(8),
                insurance_company: ["Lady Problems Insurance","Hackathon Insurance"].sample,
                policy_name: ["Family Plan B-12", "Individual Platinum"].sample,
                medical_professional: [true, false].sample,
                race: ["White", "Black or African American", "Asian", "Native Hawaiian or Other Pacific Islander", "American Indian or Alaska Native"].sample,
                birthday: rand(Date.civil(1960, 1, 1)..Date.civil(2002, 12, 31))
                })
end

one = User.find(1)
two = User.find(2)
three = User.find(3)
four = User.find(4)

entry1 = one.entries.create!({procedure_name: ["General Checkup", "Hysterectomy", "Mammography", "Delivery", "Colposcopy"].sample,
                        city: Faker::Address.city,
                        state: Faker::Address.state,
                        details: Faker::Lorem.paragraph,
                        facility_name: ["Maple Valley General Hospital", "Spring Grove Hospital", "Maple Grove Medical Clinic", "Blossom Community Hospital"].sample,
                        year: 2010 + rand(6)
                        })

bill1 = entry1.bills.create!({total_without_coverage: rand(3000.00..1500.00),
                              insurance_company: ["Lady Problems Insurance","Hackathon Insurance"].sample,
                              policy_name: ["Family Plan B-12", "Individual Platinum"].sample,
                              final_cost: rand(40.00..1500.00)
                              })
                                                                                  3.times do
  bill1.items.create!({item_name: ["Lab Test", "Surgery", "Prescribed Medication", "Screening"].sample,
        price: rand(10.00..400.00),
        quantity: [nil, 12, 5, 2].sample                                                                             })
      end

entry1b = one.entries.create!({procedure_name: ["General Checkup", "Hysterectomy", "Mammography", "Delivery", "Colposcopy"].sample,
                              city: Faker::Address.city,
                              state: Faker::Address.state,
                              details: Faker::Lorem.paragraph,
                              facility_name: ["Maple Valley General Hospital", "Spring Grove Hospital", "Maple Grove Medical Clinic", "Blossom Community Hospital"].sample,
                              year: 2010 + rand(6)
                              })

entry2 = two.entries.create!({procedure_name: ["General Checkup", "Hysterectomy", "Mammography", "Delivery", "Colposcopy"].sample,
                              city: Faker::Address.city,
                              state: Faker::Address.state,
                              details: Faker::Lorem.paragraph,
                              facility_name: ["Maple Valley General Hospital", "Spring Grove Hospital", "Maple Grove Medical Clinic", "Blossom Community Hospital"].sample,
                              year: 2010 + rand(6)
                              })

bill2 = entry2.bills.create!({total_without_coverage: rand(3000.00..1500.00),
                              insurance_company: ["Lady Problems Insurance","Hackathon Insurance"].sample,
                              policy_name: ["Family Plan B-12", "Individual Platinum"].sample,
                              final_cost: rand(40.00..1500.00)
                              })
                                                                                  6.times do
    bill2.items.create!({item_name: ["Lab Test", "Surgery", "Prescribed Medication", "Screening"].sample,
    price: rand(10.00..400.00),
    quantity: [nil, 12, 5, 2].sample                                                                             })
    end

bill2b = entry2.bills.create!({total_without_coverage: rand(3000.00..1500.00),
                                  insurance_company: ["Lady Problems Insurance","Hackathon Insurance"].sample,
                                  policy_name: ["Family Plan B-12", "Individual Platinum"].sample,
                                  final_cost: rand(40.00..1500.00)
                                  })
                                                                                 2.times do
        bill2b.items.create!({item_name: ["Lab Test", "Surgery", "Prescribed Medication", "Screening"].sample,
        price: rand(10.00..400.00),
        quantity: [nil, 12, 5, 2].sample                                                                 })
        end

entry3 = three.entries.create!({procedure_name: ["General Checkup", "Hysterectomy", "Mammography", "Delivery", "Colposcopy"].sample,
                            city: Faker::Address.city,
                            state: Faker::Address.state,
                            details: Faker::Lorem.paragraph,
                            facility_name: ["Maple Valley General Hospital", "Spring Grove Hospital", "Maple Grove Medical Clinic", "Blossom Community Hospital"].sample,
                            year: 2010 + rand(6)
                            })

bill3 = entry3.bills.create!({total_without_coverage: rand(3000.00..1500.00),
                                  insurance_company: ["Lady Problems Insurance","Hackathon Insurance"].sample,
                                  policy_name: ["Family Plan B-12", "Individual Platinum"].sample,
                                  final_cost: rand(40.00..1500.00)
                                  })
                                                                                  4.times do
    bill3.items.create!({item_name: ["Lab Test", "Surgery", "Prescribed Medication", "Screening"].sample,
    price: rand(10.00..400.00),
    quantity: [nil, 12, 5, 2].sample                                                                             })
    end
