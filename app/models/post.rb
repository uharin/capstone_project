class Post < ApplicationRecord
  belongs_to :user
  belongs_to :board_thread

  def convert_time(datetime)
    time = Time.parse(datetime.to_s).in_time_zone("Pacific Time (US & Canada)")
    time.strftime("%A, %B %e, %Y: %l:%M%P")
  end
  
  def as_json
    {
    post_text: post_text,
    created_at: convert_time(created_at),
    posted_by: user.get_name
    }
  end

end
