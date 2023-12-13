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

  def register_vehicle(vehicle)
    vehicle.register

    if vehicle.plate_type == :antique
      @collected_fees += 25
    elsif vehicle.plate_type == :ev
      @collected_fees += 200
    elsif vehicle.plate_type == :regular
      @collected_fees += 100
    end
    # To refactor this even further, you could have encapsulated the fees logic
    # into it's own method so then this register_vehicle method would only be calling 
    # helper methods - a CEO method. 
  end

  def administer_written_test(registrant)
      if @services.include?("Written Test") && registrant.permit == true && registrant.age >= 16
        #don't need the == true part since registrant.permit already returns true or false...
        #and the method we want is .permit?, not .permit.
        registrant.license_data[:written] = true
        return true
      end
      return false
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test") && registrant.license_data[:written] == true
      registrant.license_data[:license] = true
      return true
    end
    return false
  end

  def renew_drivers_license(registrant)
    if registrant.license_data[:license] == true
      registrant.license_data[:renewed] = true
      return true
    end
    return false
  end
end
