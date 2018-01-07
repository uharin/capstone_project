class User < ApplicationRecord
  has_many :addresses
  has_many :user_actions
  has_many :actions, through: :user_actions
  has_many :posts
  has_many :board_threads, through: :posts
end

