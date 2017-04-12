# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:name => 'tenra', :email => 'tenra@tenra.com', :password => 'fogefoge', :admin => true, :orgaizer => true, :agreement => true)
print '.'
User.create!(name: 'mentor_admin', email: 'mentor@admin.com', password: 'password', admin: true, :agreement => true)
print '.'
User.create!(name: 'mentor_user', email: 'mentor@user.com', password: 'password', admin: false, :agreement => true)
puts '.Admin'

10.times do
  User.create!(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "password",
              :agreement => true
            )
  print '.'
end
puts 'User'

1.upto(3) do |n|
  Event.create!(title: Faker::Lorem.sentence,
                text: "#{Faker::Lorem.paragraph}\n#{Faker::Lorem.paragraph}\n#{Faker::Lorem.paragraph}",
                image: open("#{Rails.root}/db/fixtures/img#{n}.jpg")
                )
  print '.'
end
puts 'Event'