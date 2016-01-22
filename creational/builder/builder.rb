require_relative 'car_components'
require_relative 'car'

class CarBuilder
  attr_reader :car

  def initialize
    @car = Car.new
    yield(self) if block_given?
  end

  def add_body(color)
    @car.body = Body.new(color)
  end
end

class ClassicCarBuilder < CarBuilder

  def add_engine
    @car.engine = Engine.new
  end  

  def add_wheels
    @car.wheels = Wheels.new
  end

  def add_interior(color)
    @car.interior = Interior.new(:leather, color)
  end
end

class SportCarBuilder < CarBuilder

  def add_engine
    @car.engine = SportEngine.new
  end

  def add_wheels
    @car.wheels = SportWheels.new
  end

  def add_interior(color)
    @car.interior = Interior.new(:sport, color)
  end
end

builder = ClassicCarBuilder.new do |b|
  b.add_engine
  b.add_wheels
  b.add_body(:silver)
  b.add_interior(:sand)  
end
p builder.car

builder = SportCarBuilder.new do |b|
  b.add_engine
  b.add_wheels
  b.add_body(:red)
  b.add_interior(:black)
end
p builder.car
