class User < ApplicationRecord

# Database Associations 
  has_many :addresses
  has_many :user_actions
  has_many :actions, through: :user_actions
  has_many :posts
  has_many :board_threads, through: :posts

# Authentication
  has_secure_password
  validates :username, presence: true, uniqueness: true 

end

