class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :content, presence: true, length: { minimum: 5, maximum: 300 }

  # default_scope -> { order(created_at: :desc) }
end
