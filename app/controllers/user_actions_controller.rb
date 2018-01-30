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
    render json: user_action.as_json
  end

end
    # actions = {1 => 50, 2 => 200,3 =>100,4 =>150}
    # sum = 0
    # user_actions.each do |user_action|
    #   sum += user_action.amount * actions[user_action.action_id]
    # end
    # p sum