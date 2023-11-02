require 'securerandom'
class UsersController < ApplicationController
  def login
    username = params[:user][:username]
    password = params[:user][:password]
    user = User.find_by(username:)
    
    if user&.authenticate(password)
      user_token = SecureRandom.uuid
      user.update(user_token:)
      render json: { user:, token: user_token }
    else
      render json: { error: 'Invalid username' }, status: :unprocessable_entity
    end
  end

  def signup
    user = User.new(registration_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.require(:user).permit(:username, :email, :password)
  end
end