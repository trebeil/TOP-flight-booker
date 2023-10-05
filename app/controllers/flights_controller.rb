class FlightsController < ApplicationController
  def index
    @flights = Flight.where(departure_airport_id: params[:departure_airport_id])
                      .and(Flight.where(arrival_airport_id: params[:arrival_airport_id]))
                      .select { |flight| flight.start.to_date.strftime('%d/%m/%Y') == params[:start] }
  end
end
