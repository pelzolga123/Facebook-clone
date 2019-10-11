class Post < ApplicationRecord
  # scope { order(created_at: :desc) }
  belongs_to :user
  delegate :first_name, to: :user, prefix: true 
  validates :content, presence: true, length: { minimum: 5, maximum: 500 }
end
