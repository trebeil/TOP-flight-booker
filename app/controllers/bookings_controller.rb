class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight_id: params[:flight_id])

    params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
  end
end
