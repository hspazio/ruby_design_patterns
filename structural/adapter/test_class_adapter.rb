require_relative 'car_driver'
require_relative 'petrol_car'
require_relative 'electric_car'
require_relative 'electric_car_adapter'

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
car = ElectricCar.new
puts car.description
# only 1 line of code requires changes
driver = CarDriver.new(ElectricCarAdapter.new(car)) 
driver.turn_car_on
driver.accelerate
driver.steer_left
driver.steer_right
driver.turn_car_off