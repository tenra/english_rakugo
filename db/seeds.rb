# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:name => 'tenra', :email => 'tenra@tenra.com', :password => 'fogefoge', :admin => true)

50.times do
  User.create!(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: Faker::Internet.password
            )
end

3.times do
Event.create!(title: Faker::Lorem.sentence,
                text: Faker::Lorem.paragraphs
                )
end