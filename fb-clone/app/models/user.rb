class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  has_many :posts, foreign_key: :user_id, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  validates :first_name, presence: true, unless: -> { has_facebook_linked? }
  validates :last_name, presence: true, unless: -> { has_facebook_linked? }
  # validates :date_of_birth, presence: true, unless: -> { has_facebook_linked? }
  # validates :gender, presence: true, unless: -> { has_facebook_linked? }

  def self.new_with_session(params, session)
    super.tap do |user|
      data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
      if data
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.image = auth.info.image
      user.first_name = auth.info.name.split.first
      user.last_name = auth.info.name.split.last
    end
  end

  def has_facebook_linked?
    self.provider.present? && self.uid.present?
  end
end
