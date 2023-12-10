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
    it 'registers an :antique vehicle with a registration_date' do
      expect(@camaro.registration_date).to eq(nil)
      expect(@facility_1.registered_vehicles).to eq([])
      
      @facility_1.register_vehicle(@camaro)
      
      expect(@camaro.registration_date).to eq(Date.today)
    end

    it 'registers an :ev vehicle with a registration_date' do
      expect(@bolt.registration_date).to eq(nil)
      expect(@facility_1.registered_vehicles).to eq([])  

      @facility_1.register_vehicle(@bolt)     

      expect(@bolt.registration_date).to eq(Date.today)
    end

    it 'registers an :regular vehicle with a registration_date' do
      expect(@cruz.registration_date).to eq(nil)
      expect(@facility_1.registered_vehicles).to eq([])  

      @facility_1.register_vehicle(@cruz)   
        
      expect(@cruz.registration_date).to eq(Date.today)
    end
  end 
  

  describe 'it collects fees' do
    it '#collected_fees for registered :antique vehicle' do
    #When we register an :antique vehicle, the facility collects :$25 recorded in the @collected_fees.  
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.collected_fees).to eq(25)
    end

    it '#collected_fees for registered :ev vehicles' do
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.collected_fees).to eq(200)
    end

    it '#collected_fees for registered :regular vehicles' do
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.collected_fees).to eq(100)
    end
  end


  describe 'assigns plate_types to vehicle' do
    it 'assigns #plate_type' do 
    @facility_1.register_vehicle(@bolt)
    @facility_1.register_vehicle(@cruz)
    @facility_1.register_vehicle(@camaro)

    expect(@bolt.plate_type).to eq(:ev)
    expect(@cruz.plate_type).to eq(:regular)
    expect(@camaro.plate_type).to eq(:antique)
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


  
      

      
      # expect(@facility_1.register_vehicle(@bolt)).to eq([@cruz, @camaro, @bolt])
      # expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
      # expect(@facility_2.registered_vehicles).to eq([])
      # expect(@facility_2.services).to eq([])
      # expect(@facility_2.register_vehicle(@bolt)).to eq([])
      # expect(@facility_2.registered_vehicles).to eq([])
