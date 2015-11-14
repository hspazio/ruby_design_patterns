module Creational
  module AbstractFactory
    # [Problem] There is a an application which needs to run both Symscan and Elegharn.
    #           Depending on the scanner, the application needs to use the correct 
    #           commands and configurations.
    #           If the application knows about all the commands and configurations,
    #           it's going to turn messy when a new scanner is to be added.
    # [Solution] Use AbstractFactory pattern to abstract object creation
    #            based on the family the object belongs to (Elegharn/Symscan/etc.).
    #            ConcreteFactories - ElegharnFactory and SymscanFactory implement
    #            methods to return products of their families.
    #            Elegharn and Symscan are the products that belong

    # Role > AbstractFactory
    # Not needed in Ruby because of the duck type but using it to show best practices
    class ScannerFactory
      def create_scanner
        raise NotImplementedError
      end
    end

    # Role > AbstractProduct
    # Not needed in Ruby because of the duck type but using it to show best practices
    class Scanner
      def scan
        raise NotImplementedError
      end	
    end

    # Role > ConcreteFactory
    class ElegharnFactory < ScannerFactory
      def create_scanner
        Elegharn.new
      end
    end 

    # Role > ConcreteFactory
    class SymscanFactory < ScannerFactory
      def create_scanner
        Symscan.new
      end
    end

    # Role > ConcreteProduct
    class Elegharn < Scanner
      def scan
        puts "elegharn.exe command..."
      end
    end

    # Role > ConcreteProduct
    class Symscan < Scanner
      def scan
        puts "symscan.exe command..."
      end
    end

    # Role > Client
    class Application
      def initialize(scanner_factory)
        @scanner_factory = scanner_factory
      end

      def run
        scanner = @scanner_factory.create_scanner
        scanner.scan
      end
    end 
  end # AbstractFactory
end # Creational