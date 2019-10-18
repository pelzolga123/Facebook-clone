FactoryBot.define do
  factory :friendship do
    user
    friend { nil }
    confirmed { false }
  end
end
