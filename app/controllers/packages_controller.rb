class PackagesController < ApplicationController
  before_action :authorize_admin, only: %i[create destroy]

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

    @package.user_id = @current_user.id
    if @package.save
      render json: @package, status: :created
    else
      render json: { errors: @package.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @package = Package.find(params[:id])
    @package.update(package_params)
    render json: @package
  end

  def destroy
    @package = Package.find(params[:id])

    return unless @current_user.admin?

    @package.reservations.each(&:destroy) if @package.reservations.any?

    @package.destroy
    render json: @package
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
