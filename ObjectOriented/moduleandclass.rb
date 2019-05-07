module Say_hi
  def greet_hi
    p "Hi!"
  end
  def greet_hello
    p "Hellooo!"
  end
end

module Say_hello
  def greet_hello
    p "Hello!"
  end
end

class How_do_you_do
  include Say_hello, Say_hi
  def greet_how_do_you_do
    p "How do you do?"
  end
  def greet_hello
    p "Hellow!"
  end
end

hdyd = How_do_you_do.new
hdyd.greet_hi
hdyd.greet_hello
hdyd.greet_how_do_you_do
# p hdyd.methods
p hdyd.is_a? Say_hi
p hdyd.is_a? Say_hello
p hdyd.is_a? How_do_you_do
