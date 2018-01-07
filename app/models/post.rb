class Post < ApplicationRecord
  belongs_to :user
  belongs_to :board_thread
end
