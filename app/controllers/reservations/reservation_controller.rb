class ReservationController < ApplicationController
  before_action :fetch_reservation, only: %i[update destroy]
  before_action :authenticate_user!

  def index
    # Fixed by Rubocop
    @reservations = if current_user.admin?
                      Reservation.includes(:package).all
                    else
                      current_user.reservations.includes(:package).all
                    end
    render json: @reservations
  end

  def create
    reservation = current_user.reservations.build(reservation_params)
    if reservation.save
      render json: reservation, status: :created
    else
      render json: reservation.errors, status: :unprocessable_entity
    end
  end

  def update
    if @reservation.update(reservation_params)
      render json: @reservation, status: :ok
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @reservation.destroy
      render json: { message: 'Reservation deleted!' }, status: :ok
    else
      render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def fetch_reservation
    # Fixed by Rubocop
    @reservation = if current_user.admin?
                     Reservation.find(params[:id])
                   else
                     current_user.reservations.find(params[:id])
                   end
  end

  def reservation_params
    params.require(:reservation).permit(:reservation_date, :city_name, :package_id, :user_id)
  end
end
