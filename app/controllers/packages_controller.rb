class PackagesController < ApplicationController
  before_action :authorize_admin, only: %i[create destroy] if @current_user

  def index
    @packages = Package.all
    render json: @packages
  end

  def show
    @package = Package.find(params[:id])
    render json: @package
  end

  def create
    @package = Package.new(package_params)

    @package.user_id = if @current_user
                         @current_user.id
                       else
                         1
                       end

    if @package.save
      render json: @package, status: :created
    else
      render json: { errors: @package.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @package = Package.find(params[:id])
    @package.reservations.each(&:destroy) if @package.reservations.any?

    if @package.destroy
      render json: { message: 'Package deleted successfully' }, status: :ok
    else
      render json: { errors: @package.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def package_params
    params.require(:package).permit(:name, :description, :price, :image, package_type: %i[name description price])
  end

  def authorize_admin
    return unless @current_user.nil? || !@current_user.admin?

    render json: { error: 'You are not authorized to perform this action.' }, status: :forbidden
  end
end
