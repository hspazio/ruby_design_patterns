require_relative 'car_driver'
require_relative 'petrol_car'
require_relative 'electric_car'

# before
car = PetrolCar.new
puts car.description

driver = CarDriver.new(car)
driver.turn_car_on
driver.accelerate
driver.steer_left
driver.steer_right
driver.turn_car_off

# after
# The Instance Adapter technique allows one specific instance 
# of the Adaptee to be adapted on the fly by changing the methods 
# that differ from what the Client supports.
car = ElectricCar.new
puts car.description

class << car
  def engine_on
  	starter_on
  end

  def engine_off
  	starter_off
  end
end

driver = CarDriver.new(car)
driver.turn_car_on
driver.accelerate
driver.steer_left
driver.steer_right
driver.turn_car_off