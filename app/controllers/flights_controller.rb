class FlightsController < ApplicationController
  def index
    @flight = Flight.new
    @codes = Airport.all.map { |a| [a.code, a.id] }
    @tickets = [['1', 1], ['2', 2], ['3', 3], ['4', 4]]
    @flights = Flight.dac(31)
    obtain_flights if params.key? :commit
  end

  def params_required
    params.require(:flight).permit(:departure_airport_id,
                                   :arrival_airport_id,
                                   :num_tickets,
                                   :start)
  end

  def obtain_flights
    @flights = Flight.dac(params_required[:departure_airport_id])
                     .aac(params_required[:arrival_airport_id])
                     .tickets(params_required[:num_tickets])
                     .date(params_required[:start].to_datetime)
  end
end
