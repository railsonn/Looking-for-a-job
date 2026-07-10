# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


20.times do
  Company.find_or_create_by!(name: Faker::Company.name) do |company|
    company.cnpj = Faker::Number.number(digits: 14)
    company.email = Faker::Internet.email
    company.description = Faker::Company.catch_phrase
    company.location = Faker::Address.full_address
    company.website = Faker::Internet.url
    company.active = Faker::Boolean.boolean
  end
end
