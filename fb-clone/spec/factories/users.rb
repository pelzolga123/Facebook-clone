FactoryBot.define do
  factory :user do
    first_name { 'Michael' }
    last_name { 'Hartl' }
    gender { 'male' }
    date_of_birth { '15/10/2000' }
    email { 'mhartl@example.com' }
    password { 'foobar' }
    password_confirmation { 'foobar' }
    # sequence(:email) { |n| 'test-#{n.to_s.rjust(3,"0")}@sample.com'}
    # password { 'foobar' }
    # password_confirmation { 'foobar' }
  end

  factory :random_user, class: User do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender { Faker::Gender.gender }
    date_of_birth { Faker::Date.date_of_birth }
    email { Faker::Internet.safe_email }
    password { Faker::Password.password }
    password_confirmation { Faker::Password.password_confirmation }
  end
end
