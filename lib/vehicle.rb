require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date,
              :plate_type

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
      @registration_date = Date.today
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def regular?
    @engine == :ice && Date.today.year - @year < 25
  end 

  def register
    #Nice, I like here how you encapsulated the logic into the vehicle class
    new_registration_date

    if self.antique?
      @plate_type = :antique
    elsif self.electric_vehicle?
      @plate_type = :ev
    else
      @plate_type = :regular
    end
  end
end
