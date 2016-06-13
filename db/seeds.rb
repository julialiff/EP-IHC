# Create fake users to populate db
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# User.create!(
#              name:  "Example User",
#              email: "example@railstutorial.org",
#              cellphone: "11 92341-9876",
#              birthdate: "01/02/1996",
#              occupation: "Estudante",
#              college: "USP",
#              state: "SP",
#              city: "São Paulo",
#              neighbourhood: "Tatuapé",
#              password:              "foobar",
#              password_confirmation: "foobar")

# 99.times do |n|
#   name  = Faker::Name.name
#   email = Faker::Internet.email
#   cellphone = Faker::PhoneNumber.cell_phone
#   birthdate = Faker::Date.between(30.years.ago, 20.years.ago)
#   occupation = Faker::Company.profession
#   college = Faker::University.name
#   state = Faker::Address.state_abbr
#   city = Faker::Address.city
#   neighbourhood = Faker::Address.city_prefix
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                cellphone: cellphone,
#                birthdate: birthdate,
#                occupation: occupation,
#                college: college,
#                state: state,
#                city: city,
#                neighbourhood: neighbourhood,
#                password:              password,
#                password_confirmation: password)
# end

# Create fake night houses to populate db
# NightHouse.create!(name:  "Example User",
#              email: "example@railstutorial.org",
#              password:              "foobar",
#              password_confirmation: "foobar")

99.times do |n|
  name  = Faker::Company.name
  email = "example-#{n+1}@railstutorial.org"
  cnpj = Faker::Number.number(14)
  category = Faker::Commerce.department
  state = Faker::Address.state
  city = Faker::Address.city
  neighbourhood = Faker::Address.city_prefix
  address = Faker::Address.street_address
  password = "password"


  NightHouse.create!(name:  name,
               email: email,
               cnpj: cnpj,
               category: category,
               state: state,
               city: city,
               neighbourhood: neighbourhood,
               address: address,
               password:              password,
               password_confirmation: password)
end
