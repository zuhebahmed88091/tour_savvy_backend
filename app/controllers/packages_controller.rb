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
    @package = Package.create(package_params)
    render json: @package
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
    params.require(:package).permit(:name, :description, :price, :image_url)
  end
end
