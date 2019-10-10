FactoryBot.define do
  factory :post do
    user
    content { 'There are five steps involved in setting up a data factory.' }
  end
end
