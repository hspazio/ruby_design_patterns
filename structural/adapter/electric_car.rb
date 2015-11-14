# role > Adaptee
# Or the new component to be supported which has discrepancies with
# the legacy one.
# The API for this car contain some changes to PetrolCar.
class ElectricCar
  attr_reader :description

  def initialize
    @description = 'A brand new electric car'
  end

  def starter_on
  	puts 'Pressing starter on'
  end

  def starter_off
  	puts 'Pressing starter off'
  end

  def accelerate
  	puts 'Running quite fast!'
  end

  def turn_left
  	puts 'Turning left...'
  end

  def turn_right
  	puts 'Turning right...'
  end
end	