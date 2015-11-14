class Logger   # or module
  ERROR   = 1
  WARNING = 2
  INFO    = 3

  @@level = WARNING

  def self.log
    @@log ||= File.open('log.txt', 'w')
  end

  def self.error(msg)
    log.puts("[ERROR] #{msg}")
    log.flush  
  end

  def self.warning(msg)
  	log.puts("[WARNING] #{msg}") if @@level >= WARNING 
  	log.flush
  end

  def self.info(msg)
  	log.puts("[INFO] #{msg}") if @@level >= INFO
  	log.flush
  end

  def self.level=(new_level)
  	@@level = new_level
  end
  
  def self.level
    @@level
  end	
end

Logger.level = Logger::INFO
Logger.error("This is an Error message")
Logger.warning("This is a Warning message")
Logger.info("This is an Info message")