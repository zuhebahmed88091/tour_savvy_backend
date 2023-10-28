class CurrentUserController < ApplicationController
  def index
    current_user = User.find_by(login_params[:username])
    render json: current_user
  end

  def login_params
    params.require(:user).permit(:username)
  end
end
