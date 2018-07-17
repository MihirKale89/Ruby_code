class Person

def self.my_Class_Method
  puts "This is the class method for class Person."
end
def my_Public_Method
  puts "I'm inside my public method for class Person."
  my_Private_Method
  self.my_Protected_Method
end
private
  def my_Private_Method
    puts "This is my private method for class Person."
  end

protected
  def my_Protected_Method
    puts "This is my protected method for class Person."
  end
end

class Child < Person
def child_Public_Method
  puts "I'm inside my public method for class Child."
  my_Private_Method
  my_Protected_Method
end
end

p1 = Person.new
p1.my_Public_Method
# p1.my_Private_Method - Error. Cannot call private method on explicit receiver.
# p1.my_Protected_Method - Error. Cannot call protected on Object receiver.
# Person.my_Private_Method - Error. Cannot call private method on explicit receiver.
# Person.my_Protected_Method - Error. Cannot call protected on Class receiver.
Person.my_Class_Method
# p1.my_Class_Method - Error. Cannot call Class method on Object Receiver
# Person.my_Public_Method - Error. Cannot call non class methods with Class receiver
c1 = Child.new
c1.child_Public_Method
