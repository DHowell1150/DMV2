class VehicleFactory
  attr_reader :registered_vehicles
  
  def initialize
    @registered_vehicles = []
  end

  def create_vehicles(reg_data)
    @registered_vehicles << reg_data
  end
end