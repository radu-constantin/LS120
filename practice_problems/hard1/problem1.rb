=begin
whenever the getter for DATA is called, log that operation
=end

class SecretFile
  attr_reader :log

  def initialize(secret_data, log)
    @data = secret_data
    @log = log
  end

  def data
    log.create_log_entry
    @data
  end
end

class SecurityLogger
  def initialize
    @log = []
  end

  def create_log_entry
    @log << "Secret data was accessed at #{Time.now}"
  end
end

maps = SecretFile.new('romania', SecurityLogger.new)

p maps.data
p maps.data
p maps.log
