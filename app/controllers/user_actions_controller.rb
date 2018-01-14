class UserActionsController < ApplicationController

  def index
    user_actions = UserActions.where(id: current_user[user_id]);
  end
end