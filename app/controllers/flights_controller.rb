class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @codes = Airport.all.map { |a| [a.code, a.id] }
    @tickets = [['1', 1], ['2', 2], ['3', 3], ['4', 4]]
  end
end
