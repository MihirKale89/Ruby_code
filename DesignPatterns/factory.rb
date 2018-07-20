# According to the GoF, the intent of the Factory Method pattern is to:
#
# “Define an interface for creating an object, but let subclasses decide which class to instantiate.
# Factory Method lets a class defer instantiation to subclasses.”

class Wand
  def cast_spell
    # the #get_new_spell method, defined in
    # subclasses of Wand, is our factory
    # method / template method. It determines
    # which spell is created.
    spell = get_new_spell
    spell.cast! # each spell class has a #cast! method
  end

  # the #get_new_spell factory method / template method
  # will be defined in subclasses of the Wand class.
  def get_new_spell
    raise "abstract method #get_new_spell must be defined"
  end
end

# A derivative (subclass) of the Wand class,
# responsible for defining the factory method
# #get_new_spell.
class HarryPottersWand < Wand
  # the factory method for the Harry's wand
  # creates an returns a wingardium leviosa
  # charm as the spell.
  def get_new_spell
    p 'This is the Harry Potter implementation'
    # WingardiumLeviosa.new
  end
end

# A derivative (subclass) of the Wand class,
# responsible for definig the factory method
# #get_new_spell.
class SeverusSnapesWand < Wand
  # the factory method for Snape's wand
  # creates and returns a crucio curse
  # as the spell.
  def get_new_spell
    p 'This is the Severus implementation'
    # Crucio.new
  end
end

h = HarryPottersWand.new
h.get_new_spell
s = SeverusSnapesWand.new
s.get_new_spell
