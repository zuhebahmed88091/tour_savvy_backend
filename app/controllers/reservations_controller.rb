class ReservationsController < ApplicationController
  def index
    reservations = Reservation.all
    render json: reservations
  end

  def show
    reservation = Reservation.includes(:package).find(params[:id])
    render json: reservation, include: { package: {} }
  end

  def create
    user_id = current_user.id
    reservation_params = params.require(:reservation).permit(:city_name, :reservation_date, :package_name, :package_type)
    package_name = params.dig(:reservation, :package_name)
    @package = Package.find_by(name: package_name)
    @reservation = current_user.reservations.build(reservation_params)
    @package.reservations << @reservation
    if @package.save
      render json: @reservation
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    reservation = Reservation.find(params[:id])
    reservation.update(reservation_params)
    render json: reservation
  end
  
  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    render json: reservation
  end
end
