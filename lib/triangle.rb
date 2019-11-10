require 'pry'

class Triangle
  # write code here

  attr_reader :side2, :side1, :side3, :array_format

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @array_format = [side1, side2, side3]
  end

  def kind
    #for invalid triangles
    if side1 >= side2 + side3 || side2 >= side1 + side3 || side3 >= side1 + side2 || array_format.any?{|side| side == 0}
      begin
        raise TriangleError
      # rescue TriangleError => error
      #   puts error.message
      end
    binding.pry
    elsif side1 == side2 && side2 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side1 == side3
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "Uh oh! This isn't a triangle!"
    end
  end

end
