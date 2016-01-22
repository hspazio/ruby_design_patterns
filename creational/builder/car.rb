class Car
  attr_accessor :engine, :body, :interior, :wheels

  def initialize(options = {})
    @engine = options[:engine]
    @body = options[:body]
    @interior = options[:interior]
    @wheels = options[:wheels]
  end
end