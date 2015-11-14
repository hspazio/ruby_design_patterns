# Role > Creator
class ShipFactory
  
  def self.create_ship(type)
    case type
    when 'U' then Ufo.new
    when 'R' then Rocket.new
    else nil  	
    end
  end  
end

# Role > AbstractProduct
# Not needed in Ruby due to duck typing
class Ship
  attr_reader :damage
  attr_reader :speed

  def initialize
  	raise NotImplementedError
  end
end

# Role > ConcreteProduct
class Ufo < Ship
  def initialize
    @damage = 10_000
    @speed  =  50_000_000
  end 
end

# Role > ConcreteProduct
class Rocket < Ship
  def initialize
  	@damage = 100
  	@speed  = 20_000
  end
end

# Role > Client
class Application
  
  def initialize
  	loop do
      puts "Which ship do you want to create?"
      puts "U: UFO"
      puts "R: Rocket"
      puts "press any other button to exit."
    
      type = gets.strip
      ship = ShipFactory.create_ship(type)

      ship.nil? ? break : (puts ship.inspect)
    end
  end
end