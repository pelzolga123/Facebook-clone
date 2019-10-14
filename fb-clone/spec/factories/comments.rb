FactoryBot.define do
  factory :comment do
    content { "MyText" }
    post { nil }
    user { nil }
  end
end
