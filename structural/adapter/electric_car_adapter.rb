# role > Adapter
class ElectricCarAdapter
  def initialize(electric_car)
  	@electric_car = electric_car
  end

  def engine_on
  	@electric_car.starter_on
  end

  def engine_off
  	@electric_car.starter_off
  end

  # Sometimes you may want to implement the Adapter to only support
  # Specific methods. However if your Client code grows and uses
  # other methods the Adapter will not work. This method_missing 
  # functionality delegates all other methods to the Adaptee.
  def method_missing(name, *args)
  	@electric_car.send(name, *args)
  end
end