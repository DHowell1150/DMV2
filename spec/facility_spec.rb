require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})

    @registrant_1 = Registrant.new('Bruce', 18, true )
    #=> #<Registrant:0x000000012d863e80 @age=18, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Bruce", @permit=true>

    @registrant_2 = Registrant.new('Penny', 16 )
    #=> #<Registrant:0x000000012d94ba78 @age=16, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Penny", @permit=false>

    @registrant_3 = Registrant.new('Tucker', 15 )
    #=> #<Registrant:0x000000012d8b0e38 @age=15, @license_data={:written=>false, :license=>false, :renewed=>false}, @name="Tucker", @permit=false>
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@registrant_1).to be_a(Registrant)
      expect(@registrant_2).to be_a(Registrant)
      expect(@registrant_3).to be_a(Registrant)

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
      #administered to registrant with permit
      #registrant.age >= 16
      #IF facility offers service
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_1.permit?).to eq(true)
      expect(@registrant_1.age).to eq(18)
      expect(@facility_1.services).to eq([])
      @facility_1.add_service("Written Test")
      expect(@facility_1.services).to eq(["Written Test"])

      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)

      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})


      expect(@registrant_2.permit?).to eq(false)
      expect(@registrant_2.age).to eq(16)
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
                  
      @registrant_2.earn_permit
            
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(true)         
      expect(@registrant_2.license_data[:written]).to eq(true)
            
      expect(@registrant_3.age).to eq(15)
      expect(@registrant_3.permit?).to eq(false)       
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
            
      @registrant_3.earn_permit
            
      expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
      expect(@registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'can admister a road_test' do
      #if registrant.
    end
    
    it 'can renew a drivers license' do

    end
  end
end

# Renew a driver’s license
# A license can only be renewed if the registrant has already passed the road test and earned a license

# NOTE: A facility must offer a service in order to perform it. Just because the DMV allows facilities to perform certain services, does not mean that every facility provides every service.
  
# puts "self: #{self.inspect}"
  
  
  
  # expect(@facility_1.register_vehicle(@bolt)).to eq([@cruz, @camaro, @bolt])
  # expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
  # expect(@facility_2.registered_vehicles).to eq([])
  # expect(@facility_2.services).to eq([])
  # expect(@facility_2.register_vehicle(@bolt)).to eq([])
  # expect(@facility_2.registered_vehicles).to eq([])