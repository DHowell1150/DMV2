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

# {:electric_vehicle_type=>"Battery Electric Vehicle (BEV)",
#  :vin_1_10=>"5YJ3E1EC6L",
#  :dol_vehicle_id=>"1981598",
#  :model_year=>"2020",
#  :make=>"TESLA",
#  :model=>"Model 3",
#  :vehicle_primary_use=>"Passenger",
#  :electric_range=>"308",
#  :odometer_reading=>"0",
#  :odometer_code=>"Odometer reading is not collected at time of renewal",
#  :new_or_used_vehicle=>"New",
#  :sale_price=>"0",
#  :base_msrp=>"0",
#  :transaction_type=>"Original Registration",
#  :transaction_date=>"2020-01-07T00:00:00.000",
#  :transaction_year=>"2020",
#  :county=>"King",
#  :city=>"KIRKLAND",
#  :state_of_residence=>"WA",
#  :zip=>"98034",
#  :non_clean_alternative_fuel=>"HB 2778 Eligiblity Requirements not met",
#  :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility=>"HB 2042 Eligibility Requirements not met",
#  :meets_2019_hb_2042_electric_range_requirement=>true,
#  :meets_2019_hb_2042_sale_date_requirement=>false,
#  :meets_2019_hb_2042_sale_price_value_requirement=>false,
#  :_2019_hb_2042_purchase_date_requirement=>"Non-sale, registration transaction",
#  :_2019_hb_2042_sale_price_value_requirement=>"Non-sale, registration transaction",
#  :electric_vehicle_fee_paid=>"No",
#  :transportation_electrification_fee_paid=>"No",
#  :hybrid_vehicle_electrification_fee_paid=>"No",
#  :census_tract_2020=>"53033022003",
#  :legislative_district=>"45",
#  :electric_utility=>"PUGET SOUND ENERGY INC||CITY OF TACOMA - (WA)"}