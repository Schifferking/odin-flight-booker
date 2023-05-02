class BookingsController < ApplicationController
  def new
    @booking = Booking.new(params_required)
    @num_passengers = obtain_num_passengers
    @num_passengers.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(b_params_required)

    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def params_required
    params.require(:flight).permit(:flight_id)
  end

  def b_params_required
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end

  def num_passengers_param
    params.require(:flight).permit(:num_tickets)
  end

  def obtain_num_passengers
    num_passengers_param[:num_tickets].to_i
  end
end
