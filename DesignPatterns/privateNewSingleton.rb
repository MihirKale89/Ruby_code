class Configuration
  attr_accessor :data

  def initialize
    @data = {}
  end

  def self.instance
    @@instance
  end

  def add key, value
    @data[key] = value
  end

  @@instance = Configuration.new

  private_class_method :new
end

Configuration.instance.add "Mihir", "Kale"
p Configuration.instance.data

# The next line should produce an error
c = Configuration.new
