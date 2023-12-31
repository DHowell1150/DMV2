class FacilityFactory
  attr_reader :name, 
              :address, 
              :phone

  def initialize; end

  def create_co_dmv(co_dmv_office_locations)
    created_locations = []
    co_dmv_office_locations.map do |dmv_location|
      new_dmv_hash = {
        :name => dmv_location[:dmv_office],
        :address => dmv_location[:address_li],
        :address_1 => dmv_location[:address__1],
        :city => dmv_location[:city],
        :state => dmv_location[:state],
        :zip => dmv_location[:zip],
        :phone => dmv_location[:phone]
    }
    new_dmv_hash = {
      :name => new_dmv_hash[:name],
      :address => "#{new_dmv_hash[:address]} #{new_dmv_hash[:address_1]} #{new_dmv_hash[:city]} #{new_dmv_hash[:state]} #{new_dmv_hash[:zip]}",
      :phone => new_dmv_hash[:phone]}

      created_locations << new_dmv_hash
    end
  created_locations
  end

  def create_ny_dmv(ny_dmv_office_locations)
    created_locations = []
    ny_dmv_office_locations.map do |dmv_location|
      new_dmv_hash = {
        :name => dmv_location[:office_name],
        :address => dmv_location[:street_address_line_1],
        :city => dmv_location[:city],
        :state => dmv_location[:state],
        :zip => dmv_location[:zip_code],
        :phone => dmv_location[:public_phone_number]
    }
    new_dmv_hash = {
      :name => new_dmv_hash[:name],
      :address => "#{new_dmv_hash[:address]} #{new_dmv_hash[:city]} #{new_dmv_hash[:state]} #{new_dmv_hash[:zip]}",
      :phone => new_dmv_hash[:phone]}

      created_locations << new_dmv_hash
    end
  created_locations
  end

  def create_mo_dmv(mo_dmv_office_locations)
    created_locations = []
    mo_dmv_office_locations.map do |dmv_location|
      new_dmv_hash = {
        :name => dmv_location[:name],
        :address => dmv_location[:address1],
        :city => dmv_location[:city],
        :state => dmv_location[:state],
        :zip => dmv_location[:zipcode],
        :phone => dmv_location[:phone]
    }
    new_dmv_hash = {
      :name => new_dmv_hash[:name],
      :address => "#{new_dmv_hash[:address]} #{new_dmv_hash[:city]} #{new_dmv_hash[:state]} #{new_dmv_hash[:zip]}",
      :phone => new_dmv_hash[:phone]}

      created_locations << new_dmv_hash
    end
  created_locations
  end
end