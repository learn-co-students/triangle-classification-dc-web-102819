class Triangle
  # write code here
  attr_reader :side1, :side2, :side3

  def initialize (side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def check_illegal
    if self.side1 <= 0 || self.side2 <= 0 || self.side3 <= 0
      true
    elsif (self.side1 + self.side2) <= self.side3
      true
    elsif (self.side3 + self.side2) <= self.side1
      true
    elsif (self.side1 + self.side3) <= self.side2
      true
    else
      false
    end
  end


  def kind
    if self.check_illegal
      raise TriangleError
    elsif self.side1 == self.side2 && self.side2 == self.side3
      return :equilateral
    elsif self.side1 == self.side2 || self.side2 == self.side3 || self.side3 == self.side1
      return :isosceles
    else
      return :scalene
    end
  end

  class TriangleError < StandardError
  end
end
