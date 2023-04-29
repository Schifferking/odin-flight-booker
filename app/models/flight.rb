class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  # Search by departure airport id
  scope :dac, ->(id) { where(departure_airport_id: id) }

  # Search by arrival airport id
  scope :aac, ->(id) { where(arrival_airport_id: id) }

  # Search by num of tickets
  scope :tickets, ->(num) { where(num_tickets: num) }

  # Search by start (date)
  scope :date, ->(start) { where(start: (start.beginning_of_day..start.end_of_day)) }

  # Get all dates
  def self.dates
    Flight.select(:start).order(:start)
  end

  def date_formatted
    start.strftime("%m/%d/%Y")
  end
end
