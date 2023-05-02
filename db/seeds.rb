# coding: utf-8

User.create!(name: "sample user",
            email: "sample@email.com",
            cardID: 0,
            employee_number: 0,
            password: "password",
            password_confirmation: "password",
            admin: true)
            
            

60.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  cardID = n+1
  employee = n+1
  password = "password"
  User.create!(name: name,
              email: email,
              cardID: cardID,
              employee_number: employee,
              password: password,
              password_confirmation: password)
  
end 
