module Bar
  def self.included(klass)
    klass.extend(Methods)
    klass.include(Methods)
  end
  module Methods
    def method1
      'method1'
    end

    def method2
      'method2'
    end
  end
end

class Foo
  include Bar

end

foo = Foo.new
p foo.method1
p foo.method2
p Foo.method1
p Foo.method2
