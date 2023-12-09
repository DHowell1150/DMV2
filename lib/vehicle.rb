require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @plate_type = nil
  end

  def new_registration_date
    # puts "self: #{self.inspect}"
      @registration_date = Date.today
  end

  # def determine_plate_type      ???

  # end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def regular?
    puts "pizza #{self.inspect}"
    @engine == :ice
  end

  def day_of_registration
    #register_vehicle
  end
end
