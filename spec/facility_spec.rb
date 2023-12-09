require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
      # expect(@facility_1.add_service('Vehicle Registration')).to eq(["Vehicle Registration", 'Vehicle Registration', 'New Drivers License'])   
    end
  end

  describe '#register vehicle' do
    it 'registers a vehicle with a registration_date' do
      expect(@cruz.registration_date).to eq(nil)
      expect(@facility_1.registered_vehicles).to eq([])
      
      @facility_1.register_vehicle(@cruz, @cruz.registration_date)
      
      expect(@cruz.registration_date).to eq(Date.today) #still equals nil
    end

    it 'can set the plate type' do 
    
    end

    it 'can add to a registered vehicle' do
  
    end

    it 'has a registration_date' do

    end
  end 
  
      
  describe 'it collects fees' do   #is ths a side effect of regitere_vehcle?
    it '#collected_fees for registed :antique vehicle' do
      expect(@facility_1.collected_fees).to eq(0)
      #execution
      #assertion
    end

    it '#collected_fees for registered :ev vehicles' do
      expect(@facility_1.collected_fees).to eq(0)
      #execution
      #assertion
    end
    it '#collected_fees for registered :regular vehicles' do
      expect(@facility_1.collected_fees).to eq(0)
      #execution
      #assertion
    end
  end

  describe 'assigns plate_types to vehicle' do
    it 'assigns #plate_type' do 

    end
  end

  describe 'admisters tests' do
    it 'can admister a written_test' do
      
    end

    it 'can admister a road_test' do

    end
    
    it 'can renew a drivers license' do

    end
  end

  end

      # expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])

  
      
      # expect(@cruz.plate_type).to eq(:regular)
      # expect(@facility_1.registered_vehicles).to eq([@cruz])
      # expect(@facility_1.collected_fees).to eq(100)

      # expect(@facility_1.register_vehicle(@camaro)).to eq([@cruz, @camaro])
      # @camaro.registration_date
      # expect(@camaro.plate_type).to eq:antique()
      
      # expect(@facility_1.register_vehicle(@bolt)).to eq([@cruz, @camaro, @bolt])
      # @bolt.registration_date
      # expect(@bolt.plate_type).to eq(:ev)
      # expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
      # expect(@facility_1.collected_fees).to eq(325)
      # expect(@facility_2.registered_vehicles).to eq([])
      # expect(@facility_2.services).to eq([])
      # expect(@facility_2.register_vehicle(@bolt)).to eq([])
      # expect(@facility_2.registered_vehicles).to eq([])
      # expect(@facility_2.collected_fees).to eq(0)
