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
end


# [{:office_name=>"IRONDEQUOIT",
#   :office_type=>"COUNTY OFFICE",
#   :public_phone_number=>"5857531604",
#   :street_address_line_1=>"545 TITUS AVENUE",
#   :city=>"ROCHESTER",
#   :state=>"NY",
#   :zip_code=>"14617",
#   :monday_beginning_hours=>"8:30 AM",
#   :monday_ending_hours=>"4:30 PM",
#   :tuesday_beginning_hours=>"8:30 AM",
#   :tuesday_ending_hours=>"4:30 PM",
#   :wednesday_beginning_hours=>"8:30 AM",
#   :wednesday_ending_hours=>"6:30 PM",
#   :thursday_beginning_hours=>"8:30 AM",
#   :thursday_ending_hours=>"4:30 PM",
#   :friday_beginning_hours=>"8:30 AM",
#   :friday_ending_hours=>"4:30 PM",
#   :georeference=>{:type=>"Point", :coordinates=>[-77.601698077, 43.20982583]},
#   :":@computed_region_yamh_8v7k"=>"545",
#   :":@computed_region_wbg7_3whc"=>"1676",
#   :":@computed_region_kjdx_g34t"=>"2093"},
#  {:office_name=>"RIVERHEAD",
#   :office_type=>"DISTRICT OFFICE",
#   :public_phone_number=>"7184774820",
#   :street_address_line_1=>"200 OLD COUNTRY ROAD",
#   :city=>"RIVERHEAD",
#   :state=>"NY",
#   :zip_code=>"11901",