class BoardThread < ApplicationRecord
  has_many :posts
  has_many :users, through: :posts

  def as_json
    {
    title: title,
    created_at: created_at,
    # text: post.post_text
    }
  end

end
