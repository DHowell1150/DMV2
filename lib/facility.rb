class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(facility_attributes)
    @name = facility_attributes[:name]
    @address = facility_attributes[:address]
    @phone = facility_attributes[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end
 
  # def registration_date 
  #   # Date.today #might need to put this in register_vehicle
  #   # Date.today.year
  #   #Date.new(2023, 01, 12)
  # end

  def fees_collected
    #to shovel into @collected_fees
    #might be in #register_vehicle
  end

  def register_vehicle(vehicle)
    vehicle.new_registration_date
    
    if vehicle.antique?
      @collected_fees += 25
    
    end
  end
end

# Vehicles 25 years old or older are considered antique and cost $25 to register

# Electric Vehicles (EV) cost $200 to register

# All other vehicles cost $100 to register

# A vehicle’s plate_type should be set to :regular, :antique, or :ev upon successful registration.
