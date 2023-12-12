require 'spec_helper'
require 'faraday'
require 'json'

RSpec.describe VehicleFactory do
  before do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  it 'exists' do
    expect(@wa_ev_registrations).to be_a Array
    expect(@wa_ev_registrations.count).to eq(1000)
    expect(@factory).to be_a(VehicleFactory)
  end

  it '#create_vehicles' do #I overdid this just to play with testing
    expect(@factory.create_vehicles(@wa_ev_registrations)).to be_a Array
    expect(@factory.create_vehicles(@wa_ev_registrations).count).to eq(1000)
    expect(@factory.create_vehicles(@wa_ev_registrations).first.keys.count).to eq(5)
    expect(@factory.create_vehicles(@wa_ev_registrations).first.keys.include?(:vin)).to eq(true)
    expect(@factory.create_vehicles(@wa_ev_registrations).first.keys.include?(:year)).to eq(true)
    expect(@factory.create_vehicles(@wa_ev_registrations).first[:vin]).to eq("5YJ3E1EC6L")
    expect(@factory.create_vehicles(@wa_ev_registrations).first[:year]).to eq("2020")
    expect(@factory.create_vehicles(@wa_ev_registrations).first[:make]).to eq("TESLA")
    expect(@factory.create_vehicles(@wa_ev_registrations).first[:model]).to eq("Model 3")
    expect(@factory.create_vehicles(@wa_ev_registrations).first[:engine]).to eq(:ev)
  end
end