require 'faraday'
require 'json'


class VehicleFactory
  attr_reader :vin, 
              :year, 
              :make, 
              :model, 
              :engine
  
  def initialize; end

  def create_vehicles(state_ev_registrations)
    created_vehicles = []
    state_ev_registrations.map do |vehicle|
      factory_vehicle_hash = {
        :vin => vehicle[:vin_1_10],
        :year => vehicle[:model_year],
        :make => vehicle[:make],
        :model => vehicle[:model],
        :engine => :ev
      }
      created_vehicles << factory_vehicle_hash
    end
    created_vehicles
  end

end