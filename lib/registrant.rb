class Registrant
  attr_reader :name, 
              :age, 
              :permit, 
              # we actually don't want an method for .permit
              #since whenever we want to know if they have a permit, we
              # would use the .permit? method.
              :license_data

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {:written=>false, :license=>false, :renewed=>false}
  end

  def permit?
    @permit 
  end

  def earn_permit
    @permit = true
  end
end