class Triangle
  attr_accessor :side1, :side2, :side3
  attr_reader :kind

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [@side1, @side2, @side3]
  end

  def kind
    if self.valid?
      if @side1 == @side2 && @side1 == @side3
      @kind = :equilateral
      elsif @side2 == @side3 || @side1 == @side3 || @side1 == @side2
      @kind = :isosceles
      else
      @kind = :scalene
      end
    else
      raise TriangleError
    end
  end

  def valid?
    @sides.all?{|s| s > 0} && !self.inequal?
  end

  def inequal?
    (@side1 + @side2) <= @side3 || (@side1 + @side3) <= @side2 || (@side2 + @side3) <= @side1
  end

  class TriangleError < StandardError

  end
end
