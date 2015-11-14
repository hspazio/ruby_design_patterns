
# role > Observable 
module Observable

  def initialize
    @observers = []
  end

  def add_observer(&observer)
  	@observers << observer
  end
  
  def notify_observers
    @observers.each do |observer|
      observer.call(self) 
    end
  end	
end	


# role > Subject
class TestCase
  include Observable
  
  attr_reader :name

  def initialize(name)
  	super()
    @name = name
  end

  def run
    puts "Test is running..."  
  end

  def send_results
  	puts "Sending results..."
  	notify_observers
  end
end

# role > Observer
class EmailNotifier

  attr_reader :name

  def initialize(name)
  	@name = name
  end

  def notify_watchers(test_case)
    puts "Sending an email to all watchers for #{test_case.name} test..."  
  end
end

# role > Observer
class TestCleaner
  class << self
    def cleanup
  	  puts "Deleting temporary files and resetting environment..."
    end
  end
end


# main
notifier = EmailNotifier.new(:performance)

performance = TestCase.new(:performance)

performance.add_observer do
  TestCleaner.cleanup
end

performance.add_observer do |test_case|
  puts "Got results for #{test_case.name} test"
end

performance.add_observer do |test_case|
  puts "Executing EmailNotifier.notify_watchers for #{notifier.name} test..."
  notifier.notify_watchers(test_case)
end

performance.run
performance.send_results