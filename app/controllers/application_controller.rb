class ApplicationController < ActionController::API
  before_action :set_current_user

  private

  def set_current_user
    user_token = request.headers['X-User-Token']
    @current_user = User.find_by(user_token:) if user_token
  end
end
