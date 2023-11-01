class CurrentUserController < ApplicationController
  def login
    username = login_params[:username]
    user = User.find_by(username:)
    if user
      @current_user = user
      render json: @current_user
    else
      render json: { error: 'Invalid username' }, status: :unprocessable_entity
    end
  end

  def login_params
    params.require(:user).permit(:username)
  end
end
