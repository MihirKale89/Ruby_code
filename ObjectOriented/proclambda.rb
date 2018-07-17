class ProcLambda

end

# Form 1: recommended for single line blocks
[1, 2, 3].each { |num| puts num }
# Form 2: recommended for multi-line blocks
[1, 2, 3].each do |num|
  puts num
end

def print_once
  yield
end

print_once { puts "Block is being run" }

def print_twice
  yield
  yield
end

print_twice { puts "Hello" }

def one_two_three
  yield 1
  yield 2
  yield 3
end

one_two_three { |number| puts number * 10 }

def explicit_block(&block)
  block.call # Same as yield
end

explicit_block { puts "Explicit block called" }

def do_something_with_block
  return p "No block given" unless block_given?
  yield
end

do_something_with_block
do_something_with_block { puts "Block was given."}

say_something = -> { puts "This is a lambda" }
say_something.call

# "This is a lambda"

my_lambda = -> { puts "Lambda called" }

my_lambda.call
my_lambda.()
my_lambda[]
my_lambda.===

times_two = ->(x) { x * 2 }
times_two.call(10)
# 20

t = Proc.new { |x,y| puts "I don't care about arguments!" }
t.call
# "I don't care about arguments!"

# Should work
my_lambda = -> { return 1 }
puts "Lambda result: #{my_lambda.call}"

# Should raise exception
# my_proc = Proc.new { return 1 }
# puts "Proc result: #{my_proc.call}"
# Unexpected return

# However, lambda doesn't raise exception
my_lambdaa = -> { return 1 }
puts "Lambda result: #{my_lambdaa.call}"
# Returns Lambda result: 1

def call_proc
  puts "Before proc"
  my_proc = Proc.new { return 2 }
  my_proc.call
  puts "After proc"
end

p call_proc
# Prints "Before proc" but not "After proc"

def call_lambda
  puts "Before lambda"
  my_new_lambda = -> { return 2 }
  my_new_lambda.call
  puts "After lambda"
end

p call_lambda
# Prints "Before lambda" and also "After lambda"

def call_closure_proc(my_closure_proc)
  count = 500
  my_closure_proc.call
end

count   = 1
my_closure_proc = Proc.new { p count }

p call_closure_proc(my_closure_proc) # What does this print? # It prints 1

p = 12
p p
