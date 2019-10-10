class Post < ApplicationRecord
  #scope { order(created_at: :desc) }
  belongs_to :user
<<<<<<< HEAD

=======
  validates :content, presence: true, length: { minimum: 5, maximum: 500 }
>>>>>>> 8ea8bf8961361f4ea072dcb052f91be58e1b5588
end
