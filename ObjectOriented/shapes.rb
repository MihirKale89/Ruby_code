require 'rspec/autorun'

class Shape
  def whoami?
    'I am a shape'
  end

  def calculateArea
    'Calculating the area'
  end
end

class Square < Shape
  def calculateArea(side)
    begin
      raise ArgumentError.new('Argument is not numeric') unless side.is_a? Numeric
      raise ArgumentError.new('Argument is not positive') if side < 0
    rescue ArgumentError
      return 'Please provide a numeric input for calculating the area.' unless side.is_a? Numeric
      return 'Please provide a positive input for calculating the area.' if side < 0
    end
    side * side
  end

  def talk!
    "I am a "+self.class.to_s
  end
end

class Circle < Shape
  def calculateArea(radius)
    begin
      raise ArgumentError.new('Argument is not numeric') unless radius.is_a? Numeric
      raise ArgumentError.new('Argument is not positive') if radius < 0
    rescue ArgumentError
      return 'Please provide a numeric input for calculating the area.' unless radius.is_a? Numeric
      return 'Please provide a positive input for calculating the area.' if radius < 0
    end
    Math::PI * radius * radius
  end

  def talk!
    "I am a "+self.class.to_s
  end
end

RSpec.describe Square do
  it 'claims to be a shape' do
    expect(Square.new.whoami?).to eq('I am a shape')
  end

  it 'calculates area correctly' do
    expect(Square.new.calculateArea(10)).to eq(100)
  end

  it 'tells its class' do
    expect(Square.new.talk!).to eq('I am a Square')
  end

  it 'handles non numeric input gacefully' do
    expect(Square.new.calculateArea("ten")).to eq('Please provide a numeric input for calculating the area.')
    # expect(Square.new.calculateArea("ten")).to raise_error(ArgumentError.new('Argument is not numeric'))
  end

  it 'handles non positive input gacefully' do
    expect(Square.new.calculateArea(-1)).to eq('Please provide a positive input for calculating the area.')
    # expect(Square.new.calculateArea(-1)).to raise (ArgumentError.new('Argument is not positive'))
  end
end

RSpec.describe Circle do
  it 'claims to be a shape' do
    expect(Circle.new.whoami?).to eq('I am a shape')
  end

  it 'calculates area correctly' do
    expect(Circle.new.calculateArea(10)).to eq(Math::PI*100)
  end

  it 'tells its class' do
    expect(Circle.new.talk!).to eq('I am a Circle')
  end

  it 'handles non numeric input gacefully' do
    expect(Circle.new.calculateArea("ten")).to eq('Please provide a numeric input for calculating the area.')
    # expect(Circle.new.calculateArea("ten")).to raise_error(ArgumentError.new('Argument is not numeric'))
  end

  it 'handles non positive input gacefully' do
    expect(Circle.new.calculateArea(-1)).to eq('Please provide a positive input for calculating the area.')
    # expect(Circle.new.calculateArea(-1)).to raise (ArgumentError.new('Argument is not positive'))
  end
end
