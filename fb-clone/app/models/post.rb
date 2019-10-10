class Post < ApplicationRecord
  #scope { order(created_at: :desc) }
  belongs_to :user

  validates :content, presence: true, length: { minimum: 5, maximum: 500 }

end
