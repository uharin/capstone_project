class User < ApplicationRecord

# Database Associations 
  has_many :locations
  has_many :user_actions
  has_many :actions, through: :user_actions
  has_many :posts
  has_many :board_threads, through: :posts

# Authentication
  has_secure_password
  validates :email, presence: true, uniqueness: true

end

