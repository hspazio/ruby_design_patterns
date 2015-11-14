
# role > Target
# This could also be the legacy component that our Client supports 
class PetrolCar
  attr_reader :description

  def initialize
    @description = 'A typical petrol car'
  end

  def engine_on
  	puts 'Car is now on'
  end

  def engine_off
  	puts 'Car is now off'
  end

  def accelerate
  	puts 'Running fast!'
  end

  def turn_left
  	puts 'Turning left...'
  end

  def turn_right
  	puts 'Turning right...'
  end
end	