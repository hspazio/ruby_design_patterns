# role > RealService
# This class represent the main service we want to use. It focuses on the
# core functionalities of a BankAccount.
class BankAccount
  attr_reader :balance
  
  def initialize(initial_balance = 0)
    @balance = initial_balance
  end

  def deposit(amount)
  	@balance += amount
  end

  def withdraw(amount)
  	@balance -= amount
  end
end


# role > ServiceProxy
# This class wraps the RealService around an account protection feature.
# While the RealService focuses on the core functionalities, the ServiceProxy
# focuses only on how to protect the account from misuses.
class AccountProtectionProxy
  def initialize(initial_balance, username)
  	@balance = initial_balance
  	@username = username
  end

  # Delaying the initialization of the Subject is a characteristic of the
  # VirtualProxy pattern
  def subject
  	@subject ||= BankAccount.new(@balance)
  end

  # Our simple protection mechanism is to check whether the username matches 
  # the system user
  def check_access
  	if `whoami`.strip != @username
      raise "Unauthorized user: #{@username}"
    end
  end

  # Rather than implementing all core functionalities we can easily delegate
  # all other methods to the RealService instance with method_missing() and
  # executing our protection check before that
  def method_missing(name, *args)
  	check_access
  	subject.send(name, *args)
  end
end


account = AccountProtectionProxy.new(100, 'fabio')
puts "Balance: #{account.balance}"

puts " > withdraw: #{amount = 10}"
account.withdraw(amount)
puts "Balance: #{account.balance}"

puts " > deposit: #{amount = 50}"
account.deposit(amount)
puts "Balance: #{account.balance}"

puts "Using another user..."
account = AccountProtectionProxy.new(100, 'someone_else')
account.withdraw(100)



