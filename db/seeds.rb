# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# clean DB
Requestor.destroy_all
SpaceRequest.destroy_all
Contract.destroy_all

Faker::Config.locale = 'fr'

# Generate fake data
10.times do |index|
  Requestor.create!(
    name: Faker::Name.unique.name,
    email: "odrodriguezc+#{index}@gmail.com",
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    biography: Faker::Lorem.paragraph
  )
end

first_space_request_id = SpaceRequest.first.id
2.times do |index|
  SpaceRequest.find(first_space_request_id + index + 1).accept!
end

first_contract_id = Contract.first.id
1.times do |index|
  Contract.find(first_contract_id + index + 1).update(countdown_start_at: Faker::Date.between(from: 40.days.ago, to: 32.days.ago))
end

3.times do |index|
  SpaceRequest.unconfirmed[index].update(countdown_start_at: Faker::Date.between(from: 100.days.ago, to: 91.days.ago))
end
p "Created 10 requestors."