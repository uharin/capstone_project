class UserActionsController < ApplicationController
  before_action :authenticate_user

  def index
    user_actions = current_user.user_actions
    render json: user_actions.as_json
  end

  def create
    user_action = UserAction.create({
      user_id: current_user.id,
      action_id: params[:action_id],
      amount: params[:amount]
      })

    if user_action.save
    
    # add user_action points to current user's total points
      user = current_user
      current_user.points += (params[:amount].to_i * user_action.action.point_value)
      user.update(points: current_user.points)
  
    end
    render json: user_action.as_json
  end

end