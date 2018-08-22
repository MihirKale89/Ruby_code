require 'pp'
class GameOfLife
  attr_accessor :arr1, :msg

  def initialize
    @arr1 = Array.new(3) { Array.new(3, 0) }
    @msg = "This is game of life."
  end

  def displayArray
    p @msg
    p @arr1
  end
end

gol = GameOfLife.new
gol.displayArray
