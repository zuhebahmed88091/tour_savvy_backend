class PackagesController < ApplicationController
  def index
    @packages = Package.all
    render json: @packages
  end

  def show
    @package = Package.find(params[:id])
    render json: @package
  end

  def create
    user_id = current_user.id
    @package = Package.create(package_params, user_id: user_id)

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
    @package.destroy
    render json: @package
  end

  private

  def package_params
    params.require(:package).permit(:name, :description, :price, :image, package_type: %i[name description price])
  end
end
