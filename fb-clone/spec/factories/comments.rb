FactoryBot.define do
  factory :comment do
    post
    user
    content { ' I Like your post on Angular framework ' }
  end
end
