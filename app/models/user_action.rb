class UserAction < ApplicationRecord
  belongs_to :user
  belongs_to :action

  def convert_time(datetime)
    time = Time.parse(datetime.to_s).in_time_zone("Pacific Time (US & Canada)")
    time.strftime("%A, %B %e, %Y: %l:%M%P")
  end

  def as_json
    {
      amount: amount,
      point_value: action.point_value,
      name: action.action_name,
      created_at: convert_time(created_at),
      sum: action.point_value * amount
    }
  end

end
