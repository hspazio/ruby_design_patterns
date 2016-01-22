class Engine
  attr_reader :capacity

  def initialize
    @capacity = 2_000
  end
end

class SportEngine < Engine
  def initialize
    @capacity = 4_000
  end
end

class Body
  attr_reader :color
  
  def initialize(color)
    @color = color
  end
end

class Interior
  attr_reader :material, :color

  def initialize(material, color)
    @material = material
    @color = color
  end
end

class Wheels
  attr_reader :size

  def initialize
    @size = 16
  end
end

class SportWheels < Wheels
  def initialize
    @size = 19
  end
end
