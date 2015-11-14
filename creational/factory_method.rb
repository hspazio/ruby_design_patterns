# ======================= Factory method for Symantec ======================
module Scanner

  class ScannerFactory
    def self.create_scanner(type)
      case type
      when :nis         then Scanner::Nis.new
      when :elegharn    then Scanner::Elegharn.new
      when :symcloudcan then Scanner::SymCloudScan.new
      else raise 'Unsupported Scanner'
      end
    end 
  end

  class Nis
    attr_reader :name

    def initialize
      @name = 'Norton Internet Security'
    end

    def scan
      puts "scanning using NIS..."
    end
  end

  class Elegharn
    attr_reader :name

    def initialize
      @name = 'Elegharn CLI'
    end

    def scan
      puts "scanning using Elegharn..."
    end
  end


  class SymCloudScan
    attr_reader :name

    def initialize
      @name = 'SymCloudScan'
    end

    def scan
      puts "scanning using SymCloudScan..."
    end
  end
end


# ======================= Factory method for ShipFactory ===================

module Creational
  module FactoryMethod

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
    end # Application
  end # FactoryMethod
end # Creational


# app = Creational::FactoryMethod::Application.new

puts "Choose a scanner: nis, elegharn, symcloudscan"
type = gets.strip.to_sym

scanner = Scanner::ScannerFactory.create_scanner(type)
scanner.scan
