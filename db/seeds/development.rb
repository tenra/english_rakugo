# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:name => 'tenra', :email => 'tenra@tenra.com', :password => 'fogefoge', :admin => true)
print '.'
User.create!(name: 'mentor_admin', email: 'mentor@admin.com', password: 'password', admin: true)
print '.'
User.create!(name: 'mentor_user', email: 'mentor@user.com', password: 'password', admin: false)
puts '.Admin'

50.times do
  User.create!(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "password"
            )
  print '.'
end
puts 'User'

1.upto(5) do |n|
  Event.create!(title: Faker::Lorem.sentence,
                text: "#{Faker::Lorem.paragraph}\n#{Faker::Lorem.paragraph}\n#{Faker::Lorem.paragraph}",
                image: open("#{Rails.root}/db/fixtures/img#{n}.jpg")
                )
  print '.'
end
puts 'Event'