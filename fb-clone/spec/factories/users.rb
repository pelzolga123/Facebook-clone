FactoryBot.define do
  factory :user do
    email { 'mhartl@example.com' }
    password { 'foobar' }
    password_confirmation { 'foobar' }
    # sequence(:email) { |n| 'test-#{n.to_s.rjust(3,"0")}@sample.com'}
    # password { 'foobar' }
    # password_confirmation { 'foobar' }
  end

  factory :random_user, class: User do
    email { Faker::Internet.safe_email }
    password { Faker::Password.password }
    password_confirmation { Faker::Password.password_confirmation }
  end
end
