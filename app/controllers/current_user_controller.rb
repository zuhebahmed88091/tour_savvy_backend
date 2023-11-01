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

  def create
    user = User.new(registration_params)

    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def login_params
    params.require(:user).permit(:username)
  end

  def registration_params
    params.require(:user).permit(:username)
  end
end
