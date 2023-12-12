require 'spec_helper' 
require 'faraday'
require 'json'

RSpec.describe FacilityFactory do
  before do
    @factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
  end

  it 'exists' do
    expect(@factory).to be_a(FacilityFactory)
    expect(@co_dmv_office_locations).to be_a Array
  end

  describe '#create_dmv' do
    it 'can #create_co_dmv' do
      expect(@factory.create_co_dmv(@co_dmv_office_locations)).to be_a Array
      expect(@factory.create_co_dmv(@co_dmv_office_locations).count).to eq(5)
      expect(@factory.create_co_dmv(@co_dmv_office_locations).first.keys.count).to eq(3)
      expect(@factory.create_co_dmv(@co_dmv_office_locations).first[:name]).to eq("DMV Tremont Branch")
      expect(@factory.create_co_dmv(@co_dmv_office_locations).first[:address]).to eq("2855 Tremont Place Suite 118 Denver CO 80205")
      expect(@factory.create_co_dmv(@co_dmv_office_locations).first[:phone]).to eq("(720) 865-4600")
    end 

    it 'can #create_ny_dmv' do
      expect(@factory.create_ny_dmv(@ny_dmv_office_locations)).to be_a Array
      expect(@factory.create_ny_dmv(@ny_dmv_office_locations).count).to eq(173)
      expect(@factory.create_ny_dmv(@ny_dmv_office_locations).first.keys.count).to eq(3)
      expect(@factory.create_ny_dmv(@ny_dmv_office_locations).first[:name]).to eq("IRONDEQUOIT")
      expect(@factory.create_ny_dmv(@ny_dmv_office_locations).first[:address]).to eq("545 TITUS AVENUE ROCHESTER NY 14617")
      expect(@factory.create_ny_dmv(@ny_dmv_office_locations).first[:phone]).to eq("5857531604")
    end

    it 'can #create_dmv' do
      expect(@factory.create_mo_dmv(@mo_dmv_office_locations)).to be_a Array
      expect(@factory.create_mo_dmv(@mo_dmv_office_locations).count).to eq(178)
      expect(@factory.create_mo_dmv(@mo_dmv_office_locations).first.keys.count).to eq(3)
      expect(@factory.create_mo_dmv(@mo_dmv_office_locations).first[:name]).to eq("DEXTER")
      expect(@factory.create_mo_dmv(@mo_dmv_office_locations).first[:address]).to eq("119 VINE ST DEXTER MO 63841")
      expect(@factory.create_mo_dmv(@mo_dmv_office_locations).first[:phone]).to eq("(573) 624-8808")
    end
  end
end
# :name=>"DEXTER",
# :address1=>"119 VINE ST",
# :city=>"DEXTER",
# :state=>"MO",
# :zipcode=>"63841",
# :phone=>"(573) 624-8808",