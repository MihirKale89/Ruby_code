require 'singleton'

class Configuration
  include Singleton

  attr_accessor :data

  def initialize
    @data = {}
  end

  def add key, value
    @data[key] = value
  end

  def version
    '0.0.1'
  end
end

Configuration.instance.add "Mihir", "Kale"
p Configuration.instance.data

# The next line should throw an error
c = Configuration.new
