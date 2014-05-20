FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Example User #{n}" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password 'foobar'
    password_confirmation 'foobar'

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end
end