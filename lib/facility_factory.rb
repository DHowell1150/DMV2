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
# [{:number=>"086",
#   :dorregionnumber=>"14",
#   :type=>"1MV",
#   :name=>"DEXTER",
#   :address1=>"119 VINE ST",
#   :city=>"DEXTER",
#   :state=>"MO",
#   :zipcode=>"63841",
#   :county=>"Stoddard",
#   :phone=>"(573) 624-8808",
#   :fax=>"(573) 624-8724",
#   :size=>"2",
#   :email=>"DEXTERAGENTOFFICE@DOR.MO.GOV",
#   :agent=>"STODDARD COUNTY LICENSE OFFICE",
#   :officemanager=>"RAY ROWLAND",
#   :daysopen=>"Monday - Friday - 8:30 to 4:30",
#   :holidaysclosed=>
#    "Independence Day (07/04/22), Labor Day (09/05/22), Columbus Day (10/10/22), Veterans Day (11/11/22), Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), Lincoln’s Birthday (02/13/23), President’s Day (02/20/23), Truman’s Birthday (05/08/23), Memorial Day (05/29/23), Juneteenth (06/19/2023), Independence Day (07/04/23), Labor Day (09/04/23), Columbus Day (10/09/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)",
#   :additionaldaysclosed=>
#    "10/4/2022 (at 2:00 PM),   11/25/22,   12/22/2022 (at 3:00 PM ),   12/23/22,  12/24/22,  12/26/22,   12/27/2022 (open at 8:30 AM ),  1/31/2023,   4/7/23,   7/3/23,   11/24/23,   12/22/23",
#   :latlng=>{:latitude=>"36.791655", :longitude=>"-89.955942"},
#   :additional_license_office_info=>
#    "Services for the Elderly or Disabled: Curbside Service, Special Appointments, Assist with changing or replacing plates/tabs, Process Transactions in the customer waiting area, Direct customers to front of the line, Wheelchair availability. MOTOR VEHICLE PHONE IN RENEWAL - (573) 624-8808Other Services: Motor Vehicle transaction drop-off service.",
#   :":@computed_region_ny2h_ckbz"=>"452",
#   :":@computed_region_c8ar_jsdj"=>"98",
#   :":@computed_region_ikxf_gfzr"=>"2215"},
#  {:number=>"166",
#   :dorregionnumber=>"8",
#   :type=>"1MV",