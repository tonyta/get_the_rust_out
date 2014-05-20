namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Tony Ta",
                email: "tonyta.tt@gmail.com",
                password: "password",
                password_confirmation: "password",
                admin: true)
    User.create!(name: "Example User",
                email: "example@railstutorial.org",
                password: "password",
                password_confirmation: "password")
    99.times do |n|
      name  = Faker::Name.name
      email = Faker::Internet.email
      password = "password"
      User.create!(name: name,
                  email: email,
                  password: password,
                  password_confirmation: password)
    end
    users = User.first(6)
    users.each do |user|
      50.times do
        content = Faker::Lorem.sentence(5)
        user.microposts.create!(content: content)
      end
    end
  end
end
