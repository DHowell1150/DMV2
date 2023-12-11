require 'spec_helper'
require 'faraday'
require 'json'

RSpec.describe VehicleFactory do
  before do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  it 'exists' do
    expect(@factory).to be_a(VehicleFactory)
  end

  it '#create_vehicles' do
  expected = load_data('https://data.wa.gov/resource/rpr4-cgyd.json')
    expect(@factory.create_vehicles(@wa_ev_registrations)).to eq(expected)
  end
end