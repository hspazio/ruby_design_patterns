# role > Context
class Car
  attr_accessor :state

  def initialize
    @state = StateOff
  end

  def method_missing(name, *args)
  	if name.to_s.start_with?('can_') && name.to_s.end_with?('?')
      @state.respond_to?(name.to_s.gsub('can_', '').gsub('?', ''))
  	else
      @state.send(name, self, *args)
    end
  end
end

# role > States
class StateOff
  def self.start(context)
    puts 'car is off! Turning on...'
    context.state = StateStarted
  end
end

class StateStarted
  def self.drive(context)
  	puts 'Gear 1 and ready to go...'
  	context.state = StateDriving
  end
end

class StateDriving
  def self.park(context)
  	puts 'Looking for parking...'
  	context.state = StateParking
  end

  def self.stop(context)
  	puts 'Stopping immediately!'
  	context.state = StateOff
  end
end

class StateParking
  def self.stop(context)
  	puts 'Parking...'
  	context.state = StateOff
  end
end

car = Car.new
p car
puts "Car can start? #{car.can_start?}"
puts "Car can stop? #{car.can_stop?}"
car.start
p car
car.drive
p car
car.stop
p car

puts "\n2nd Round\n\n"
car.start
p car
car.drive
p car
car.park
p car
car.stop
p car
