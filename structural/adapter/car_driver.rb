# role > Client
# This implements all methods that consist in driving a car (a petrol car)
class CarDriver
  def initialize(car)
    @car = car
  end

  def turn_car_on
  	@car.engine_on
  end

  def turn_car_off
  	@car.engine_off
  end

  def accelerate
    @car.accelerate
  end

  def steer_left
    @car.turn_left
  end

  def steer_right
    @car.turn_right
  end
end