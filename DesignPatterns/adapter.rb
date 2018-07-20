# According to the GoF, the intent of the Adapter pattern is to:
#
# “Convert the interface of a class into another interface clients expect.
# Adapter lets classes work together that couldn’t otherwise because of incompatible interfaces.”

# The Hammer class, in this example,
# acts as an 'adaptee'. It has an
# existing interface, which we want
# to adapt to a common, 'Tool' interface.
class Hammer
  def swing!
    # code that swings hammer goes here.
    p 'This is a swing'
  end
end

# The Tool class is the new, 'target'
# interface that we want to use within
# our system.
class Tool
  def initialize(adapter)
    @adapter = adapter
  end

  def use_tool
    @adapter.use_tool
  end
end

# The HammerAdapter is the 'adapter'
# in our application of the Adapter
# pattern.
class HammerAdapter
  def initialize(hammer)
    @hammer = hammer
  end

  # The use_tool method wraps the old
  # hammer #swing! method behind a new
  # interface method, which we desire
  # all of our tools to use.
  def use_tool
    @hammer.swing!
  end
end

# In our client implementation, we instantiate
# a hammer, pass it into a hammer adapter, and
# then pass the hammer adapter into our 'target',
# an instance of the Tool class.
hammer = Hammer.new
hammer_adapter = HammerAdapter.new(hammer)
tool = Tool.new(hammer_adapter)

# We can now use the tool as we would any other
# tool in our system. Behind the scenes,
# however, a hammer is being swung.
tool.use_tool
