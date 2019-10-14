class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true, length: { minimum: 5, maximum: 300 }

  #default_scope -> { order(created_at: :desc) }
end
