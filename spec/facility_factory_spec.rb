require 'spec_helper' 
require 'faraday'
require 'json'

RSpec.describe FacilityFactory do
  before do
    @factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
  end

  it 'exists' do
    expect(@factory).to be_a(FacilityFactory)
    expect(@co_dmv_office_locations).to be_a Array
  end

  it 'create_dmv' do
    expect(@factory.create_dmv(@co_dmv_office_locations)).to be_a Array
    expect(@factory.create_dmv(@co_dmv_office_locations).count).to eq(5)
    expect(@factory.create_dmv(@co_dmv_office_locations).first.keys.count).to eq(3)
    expect(@factory.create_dmv(@co_dmv_office_locations).first[:name]).to eq("DMV Tremont Branch")
    expect(@factory.create_dmv(@co_dmv_office_locations).first[:address]).to eq("2855 Tremont Place Suite 118 Denver CO 80205")
    expect(@factory.create_dmv(@co_dmv_office_locations).first[:phone]).to eq("(720) 865-4600")
  end
end