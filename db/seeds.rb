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

# asserts:
# - 10 emails confirmation
10.times do |index|
  Requestor.create!(
    name: Faker::Name.unique.name,
    email: "odrodriguezc+#{index+1}@gmail.com",
    phone_number: Faker::PhoneNumber.cell_phone_with_country_code,
    biography: Faker::Lorem.paragraph
  )
end

# asserts:
# - 2 contracts
# - 2 new contract email [odrodriguezc1, odrodriguezc2]
first_space_request_id = SpaceRequest.first.id
2.times do |index|
  SpaceRequest.find(first_space_request_id + index).accept!
end

# asserts:
# - 1 contract to renew
# - in 5 minutes renew contract
# - email contract renew to odrodriguezc1

Contract.first.update(countdown_start_at: Faker::Date.between(from: 40.days.ago, to: 32.days.ago))


# asserts:
# - 3 space request confirmed
# - 3 space request to renew
# - 3 emails to renew [odrodriguezc3, odrodriguezc4, odrodriguezc5]
3.times do |index|
  SpaceRequest.unconfirmed[index].update(
    countdown_start_at: Faker::Date.between(from: 100.days.ago, to: 91.days.ago),
    status: 1
  )
end
p "Created 10 requestors."