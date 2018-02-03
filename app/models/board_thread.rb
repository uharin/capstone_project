class BoardThread < ApplicationRecord
  has_many :posts
  has_many :users, through: :posts
  belongs_to :user

  def convert_time(datetime)
    time = Time.parse(datetime.to_s).in_time_zone("Pacific Time (US & Canada)")
    time.strftime("%A, %B %e, %Y: %l:%M%P")
  end
  
  def as_json
    {
    id: id,
    title: title,
    created_at: convert_time(created_at),
    posted_by: user.get_name
    }
  end

end
