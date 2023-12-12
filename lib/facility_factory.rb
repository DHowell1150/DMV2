class FacilityFactory
  attr_reader :name, 
              :address, 
              :phone

  def initialize; end

  def create_dmv(dmv_office_locations)
    created_locations = []
    dmv_office_locations.map do |dmv_location|
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
end

# => [{:the_geom=>{:type=>"Point", :coordinates=>[-104.97443112500002, 39.75525297420336]},
#   :dmv_id=>"1",
#   :dmv_office=>"DMV Tremont Branch",
#   :address_li=>"2855 Tremont Place",
#   :address__1=>"Suite 118",
#   :city=>"Denver",
#   :state=>"CO",
#   :zip=>"80205",
#   :phone=>"(720) 865-4600",
#   :hours=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.",
#   :services_p=>"vehicle titles, registration, renewals;  VIN inspections",
#   :parking_no=>"parking available in the lot at the back of the bldg (Glenarm Street)",
#   :photo=>"images/Tremont.jpg",
#   :address_id=>"175164",
#   :":@computed_region_nku6_53ud"=>"1444"},