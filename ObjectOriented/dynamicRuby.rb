# define_method(name, &block)
# instance_variable_set("@name", value)
# instance_variable_get("@name")
# class Test
#   define_method "loic" do
#     "chollier"
#   end
# end

class BaseModel
  # Implement
  # attr_accessor :first_name, :last_name

#   def initialize(first_name = 'blank', last_name = 'blank')
#     @first_name = first_name
#     @last_name = last_name
#   end
  # @first_name, @last_name



  def first_name=(value = 'blank')
      @first_name = value
  end

  def self.attribute(symbol, value = "blank")
    # puts "something is happening"
    # p symbol
    # p value#
    instance_variable_set("@#{symbol}", value)
    #here
    #
    # symbo
    define_method symbol do
      instance_variable_get("@#{symbol}") || value[:default]
      # if value != {:default=>"(blank)"}
      #   return instance_variable_get("@#{symbol}")
      # else
      #  return "blank"
      # end
    end

    define_method "#{symbol}=" do |argument|
      # puts "Argument ==>"+argument
      instance_variable_set("@#{symbol}", argument)
    end
  end
  # define_method(attribute)

end

class Person < BaseModel
  attribute :first_name, default: "(blank)"
  attribute :last_name, default: "something"
  # attribute :age, default: 12
end

# t = Test.new

p = Person.new

puts p.first_name # => "(blank)"
puts p.last_name # => "(blank)"

p.first_name = "Pol"
p.last_name = "Miro"
puts p.first_name # => "Pol"
puts p.last_name # => "Miro"
